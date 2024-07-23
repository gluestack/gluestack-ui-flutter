import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_style.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/tool_tip_position_delegate.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/tooltip_utils.dart';
import 'bubble_shape.dart';

enum GSTooltipPosition {
  top,
  left,
  bottom,
  right,
}

enum CloseButtonType { inside, outside }

enum ClipAreaShape { oval, rectangle }

enum Event { show, hide }

class GSToolTip extends StatefulWidget {
  final String content;

  /// The preferred placement of the tooltip relative to the target widget.
  ///
  final GSTooltipPosition placement;

  final Widget? child;

  final Duration fadeInDuration;

  final Duration fadeOutDuration;

  /// [distance] Space between the tooltip and the trigger.
  final double distance;

  /// Custom styling for the tooltip.
  final GSStyle? style;

  /// If true, the text will be truncated with an ellipsis if it overflows.
  final bool isTruncated;

  /// The size of the tooltip text.
  final GSToolTipSizes? size;

  /// If true, the text will be displayed in bold.
  final bool bold;

  /// If true, the text will be displayed in italics.
  final bool italic;

  /// If true, the text will be underlined.
  final bool underline;

  /// If true, the text will have a strikethrough decoration.
  final bool strikeThrough;

  /// If true, the text will be highlighted.
  final bool highlight;

  /// If true, the text will be displayed as a subscript.
  final bool sub;

  final bool enableNotch;

  const GSToolTip({
    super.key,
    required this.content,
    this.placement = GSTooltipPosition.top,
    this.style,
    this.sub = false,
    this.isTruncated = false,
    this.bold = false,
    this.highlight = false,
    this.italic = false,
    this.size,
    this.strikeThrough = false,
    this.underline = false,
    this.child,
    this.fadeInDuration = const Duration(milliseconds: 250),
    this.fadeOutDuration = const Duration(milliseconds: 250),
    this.distance = 2.0,
    required this.enableNotch,
  });

  static Key insideCloseButtonKey = const Key("InsideCloseButtonKey");
  static Key outsideCloseButtonKey = const Key("OutsideCloseButtonKey");
  static Key barrierKey = const Key("barrierKey");
  static Key bubbleKey = const Key("bubbleKey");

  @override
  State createState() => _GSToolTipState();
}

class _GSToolTipState extends State<GSToolTip>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late AnimationController _animationController;
  GSTooltipController? _gsTooltipController;
  OverlayEntry? _entry;
  OverlayEntry? _barrierEntry;
  OverlayEntry? blur;
  bool showBarrier = false;
  Color? barrierColor;
  late bool hasShadow;
  late Color shadowColor;
  late double shadowBlurRadius;
  late double shadowSpreadRadius;
  late Offset shadowOffset;
  late bool showBlur;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: widget.fadeInDuration,
      reverseDuration: widget.fadeOutDuration,
      vsync: this,
    );
    _gsTooltipController = GSTooltipController();
    _gsTooltipController!.addListener(_onChangeNotifier);

    // TD: Mouse stuff
    super.initState();
  }

  @override
  void didUpdateWidget(GSToolTip oldWidget) {
    _gsTooltipController!.removeListener(_onChangeNotifier);
    _gsTooltipController = GSTooltipController();
    _gsTooltipController!.addListener(_onChangeNotifier);

    super.didUpdateWidget(oldWidget);
  }

  // @override
  @override
  void dispose() {
    if (_entry != null) _removeEntries();
    _gsTooltipController?.removeListener(_onChangeNotifier);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showBarrier = false;
    barrierColor = Colors.black54;
    hasShadow = false;
    shadowColor = Colors.transparent;
    shadowBlurRadius = 10.0;
    shadowSpreadRadius = 5.0;
    shadowOffset = Offset.zero;
    showBlur = false;

    return CompositedTransformTarget(
      link: _layerLink,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: MouseRegion(
          opaque: true,
          hitTestBehavior: HitTestBehavior.opaque,
          child: widget.child,
          onEnter: (PointerEvent details) {
            _gsTooltipController!.showTooltip();
          },
          onExit: (PointerEvent details) {
            _gsTooltipController!.hideTooltip();
          },
        ),
      ),
    );
  }

  void _onChangeNotifier() {
    switch (_gsTooltipController!.event) {
      case Event.show:
        _showTooltip();
        break;
      case Event.hide:
        _hideTooltip();
        break;
    }
  }

  void _createOverlayEntries() {
    final textSize = widget.size ?? toolTipTextStyle.props?.size;
    final subFontSize = toolTipTextStyle.variants?.sub?.textStyle?.fontSize;

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [
        toolTipStyle,
      ],
      inlineStyle: widget.style,
    );

    GSConfigStyle toolTipTextStyler = resolveStyles(
      context: context,
      styles: [
        toolTipTextStyle,
        widget.highlight ? toolTipTextStyle.variants?.highlight : null,
        toolTipTextStyle.sizeMap(textSize?.toGSSize),
      ],
      inlineStyle: widget.style,
    );

    toolTipTextStyler.textStyle = toolTipTextStyler.textStyle?.copyWith(
          color: toolTipTextStyler.color?.getColor(context) ??
              toolTipTextStyle.color?.getColor(context),
          fontFamily: toolTipTextStyler.textStyle?.fontFamily,
          fontWeight: widget.bold
              ? FontWeight.w900
              : toolTipTextStyler.textStyle?.fontWeight,
          fontStyle: widget.italic
              ? FontStyle.italic
              : toolTipTextStyler.textStyle?.fontStyle,
          fontSize:
              widget.sub ? subFontSize : toolTipTextStyler.textStyle?.fontSize,
          decoration: TextDecoration.combine([
            if (widget.strikeThrough) TextDecoration.lineThrough,
            if (widget.underline) TextDecoration.underline,
          ]),
          backgroundColor: widget.highlight
              ? toolTipTextStyler.bg?.getColor(context)
              : toolTipTextStyler.textStyle?.backgroundColor,
          overflow: widget.isTruncated
              ? TextOverflow.ellipsis
              : toolTipTextStyler.textStyle?.overflow,
        ) ??
        const TextStyle();
    TooltipStyleClass tooltipStyle = TooltipStyleClass(
      styler: styler,
      toolTipTextStyler: toolTipTextStyler,
    );
    final renderBox = context.findRenderObject() as RenderBox;

    final overlayState = Overlay.of(context);
    RenderBox? overlay;

    // ignore: unnecessary_null_comparison
    if (overlayState != null) {
      overlay = overlayState.context.findRenderObject() as RenderBox?;
    }

    final size = renderBox.size;
    final target = renderBox.localToGlobal(size.center(Offset.zero));
    final animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );
    final offsetToTarget = Offset(-target.dx, -target.dy);

    var constraints = BoxConstraints(
      minHeight: 0,
      minWidth: 0,
      maxHeight: widget.style?.maxHeight ?? double.infinity,
      maxWidth: widget.style?.maxWidth ?? double.infinity,
    );
    var preferredDirection = widget.placement;

    _barrierEntry = showBarrier
        ? OverlayEntry(
            builder: (context) => FadeTransition(
              opacity: animation,
              child: Container(),
            ),
            // ),
          )
        : null;

    blur = showBlur
        ? OverlayEntry(
            builder: (BuildContext context) => FadeTransition(
              opacity: animation,
              child: BackdropFilter(
                filter: ImageFilter.blur(),
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          )
        : null;
    _entry = OverlayEntry(
      builder: (BuildContext context) => FadeTransition(
        opacity: animation,
        child: Center(
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: offsetToTarget,
            child: CustomSingleChildLayout(
              delegate: TooltipPositionDelegate(
                preferredDirection: preferredDirection,
                constraints: constraints,
                top: null,
                childTargetSize: size,
                bottom: null,
                left: null,
                right: null,
                target: target,
                overlay: overlay,
              ),
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      key: GSToolTip.bubbleKey,
                      margin: GSUtils.getTooltipMargin(
                        distance: widget.distance,
                        preferredDirection: preferredDirection,
                      ),
                      decoration: ShapeDecoration(
                        color: tooltipStyle.styler.bg?.getColor(context) ??
                            GSTheme.of(context).background100,
                        shadows: hasShadow
                            ? <BoxShadow>[
                                BoxShadow(
                                  blurRadius: shadowBlurRadius,
                                  spreadRadius: shadowSpreadRadius,
                                  color: shadowColor,
                                  offset: shadowOffset,
                                ),
                              ]
                            : null,
                        shape: BubbleShape(
                          tooltipColor:
                              tooltipStyle.styler.bg?.getColor(context) ??
                                  GSTheme.of(context).background100,
                          childTargetSize: size,
                          enableNotch: widget.enableNotch,
                          distance: widget.distance,
                          bottom: null,
                          left: null,
                          preferredDirection: preferredDirection,
                          right: null,
                          target: target,
                          top: null,
                          bubbleDimensions: const EdgeInsets.all(10),
                        ),
                      ),
                      child: Text(
                        widget.content,
                        style: tooltipStyle.toolTipTextStyler.textStyle,
                      ),
                    ),
                    //),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // ignore: unnecessary_null_comparison
    if (overlayState != null) {
      overlayState.insertAll([
        if (showBlur) blur!,
        if (showBarrier) _barrierEntry!,
        _entry!,
      ]);
    }
  }

  _showTooltip() async {
    // widget.onShow?.call();

    // Already visible.
    if (_entry != null) return;

    _createOverlayEntries();

    await _animationController
        .forward()
        .whenComplete(_gsTooltipController!.complete);
  }

  _removeEntries() {
    _entry?.remove();
    _entry = null;
    _barrierEntry?.remove();
    _entry = null;
    blur?.remove();
  }

  _hideTooltip() async {
    // widget.onHide?.call();
    await _animationController
        .reverse()
        .whenComplete(_gsTooltipController!.complete);

    _removeEntries();
  }
}
