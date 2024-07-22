import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_style.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_text_style.dart';
import 'package:gluestack_ui/src/widgets/gss_tooltip/tool_tip_position_delegate.dart';
import 'package:gluestack_ui/src/widgets/gss_tooltip/tooltip.dart';
import 'bubble_shape.dart';

// enum TooltipDirection { up, down, left, right }
enum GSTooltipPosition {
  top,
  right,
  bottom,
  left,
}

enum CloseButtonType { inside, outside }

enum ClipAreaShape { oval, rectangle }

enum Event { show, hide }

class SuperTooltip extends StatefulWidget {
  final String content;

  /// The preferred placement of the tooltip relative to the target widget.
  ///
  final GSTooltipPosition popupDirection;
  final SuperTooltipController? controller;
  final void Function()? onLongPress;
  final void Function()? onShow;
  final void Function()? onHide;
  final bool snapsFarAwayVertically;
  final bool snapsFarAwayHorizontally;
  final double? top, right, bottom, left;
  final double minimumOutsideMargin;
  final Widget? child;
  final BoxConstraints constraints;
  final Color? backgroundColor;
  final Decoration? decoration;
  final double elevation;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final double arrowLength;
  final double arrowBaseWidth;

  /// [distance] Space between the tooltip and the trigger.
  final double distance;
  // final double borderRadius;
  final double borderWidth;

  final EdgeInsetsGeometry overlayDimensions;
  final EdgeInsetsGeometry bubbleDimensions;
  final bool toggleOnTap;

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

  const SuperTooltip({
    super.key,
    required this.content,
    this.popupDirection = GSTooltipPosition.bottom,
    this.controller,
    this.onLongPress,
    this.onShow,
    this.onHide,
    this.style,
    this.sub = false,
    this.isTruncated = false,
    this.bold = false,
    this.highlight = false,
    this.italic = false,
    this.size,
    this.strikeThrough = false,
    this.underline = false,
    /**
     * showCloseButton 
     * This will enable the closeButton 
     */

    this.snapsFarAwayVertically = false,
    this.snapsFarAwayHorizontally = false,
    this.top,
    this.right,
    this.bottom,
    this.left,
    // TD: Make edgeinsets instead
    this.minimumOutsideMargin = 20.0,
    this.elevation = 0.0,
    // TD: The native flutter tooltip uses verticalOffset
    //  to space the tooltip from the child. But we'll likely
    // need just offset, since it's 4 way directional
    // this.verticalOffset = 24.0,
    this.backgroundColor,
    this.decoration,
    this.child,
    this.constraints = const BoxConstraints(
      minHeight: 0.0,
      maxHeight: double.infinity,
      minWidth: 0.0,
      maxWidth: double.infinity,
    ),
    this.fadeInDuration = const Duration(milliseconds: 250),
    this.fadeOutDuration = const Duration(milliseconds: 250),
    this.arrowLength = 20.0,
    this.arrowBaseWidth = 20.0,
    this.distance = 2.0,
    this.borderWidth = 0.0,
    // this.borderRadius = 10.0,
    this.overlayDimensions = const EdgeInsets.all(10),
    this.bubbleDimensions = const EdgeInsets.all(10),
    this.toggleOnTap = false,
  });

  static Key insideCloseButtonKey = const Key("InsideCloseButtonKey");
  static Key outsideCloseButtonKey = const Key("OutsideCloseButtonKey");
  static Key barrierKey = const Key("barrierKey");
  static Key bubbleKey = const Key("bubbleKey");

  @override
  State createState() => _SuperTooltipState();
}

class _SuperTooltipState extends State<SuperTooltip>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late AnimationController _animationController;
  SuperTooltipController? _superTooltipController;
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
    _superTooltipController = widget.controller ?? SuperTooltipController();
    _superTooltipController!.addListener(_onChangeNotifier);

    // TD: Mouse stuff
    super.initState();
  }

  @override
  void didUpdateWidget(SuperTooltip oldWidget) {
    if (_superTooltipController != widget.controller) {
      _superTooltipController!.removeListener(_onChangeNotifier);
      _superTooltipController = widget.controller ?? SuperTooltipController();
      _superTooltipController!.addListener(_onChangeNotifier);
    }
    super.didUpdateWidget(oldWidget);
  }

  // @override
  @override
  void dispose() {
    if (_entry != null) _removeEntries();
    _superTooltipController?.removeListener(_onChangeNotifier);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      child: MouseRegion(
        onEnter: (_) {
          _superTooltipController!.showTooltip();
        },
        onExit: (_) {
          // if (widget.toggleOnTap && _superTooltipController!.isVisible) {
          _superTooltipController!.hideTooltip();
          //  }
        },
        // onTap: () {
        //   if (widget.toggleOnTap && _superTooltipController!.isVisible) {
        //     _superTooltipController!.hideTooltip();
        //   } else {
        //     _superTooltipController!.showTooltip();
        //   }
        // },
        // onLongPress: widget.onLongPress,
        child: widget.child,
      ),
    );
  }

  void _onChangeNotifier() {
    switch (_superTooltipController!.event) {
      case Event.show:
        _showTooltip();
        break;
      case Event.hide:
        _hideTooltip();
        break;
    }
  }

  void _createOverlayEntries() {
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
    final offsetToTarget = Offset(
      -target.dx + size.width / 2,
      -target.dy + size.height / 2,
    );
    final backgroundColor =
        widget.backgroundColor ?? Theme.of(context).cardColor;

    var constraints = widget.constraints;
    var preferredDirection = widget.popupDirection;
    var left = widget.left;
    var right = widget.right;
    var top = widget.top;
    var bottom = widget.bottom;

    if (widget.snapsFarAwayVertically) {
      constraints = constraints.copyWith(maxHeight: null);
      left = right = 0.0;

      if (overlay != null) {
        if (target.dy > overlay.size.center(Offset.zero).dy) {
          preferredDirection = GSTooltipPosition.top;
          top = 0.0;
        } else {
          preferredDirection = GSTooltipPosition.bottom;
          bottom = 0.0;
        }
      } else {
        // overlay is null - set default values
        preferredDirection = GSTooltipPosition.bottom;
        bottom = 0.0;
      }
    } else if (widget.snapsFarAwayHorizontally) {
      constraints = constraints.copyWith(maxHeight: null);
      top = bottom = 0.0;

      if (overlay != null) {
        if (target.dx < overlay.size.center(Offset.zero).dx) {
          preferredDirection = GSTooltipPosition.right;
          right = 0.0;
        } else {
          preferredDirection = GSTooltipPosition.left;
          left = 0.0;
        }
      } else {
        // overlay is null - set default values
        preferredDirection = GSTooltipPosition.left;
        left = 0.0;
      }
    }

    _barrierEntry = showBarrier
        ? OverlayEntry(
            builder: (context) => FadeTransition(
              opacity: animation,
              // child:
              // GestureDetector(
              //   onTap: widget.hideTooltipOnBarrierTap
              //       ? _superTooltipController!.hideTooltip
              //       : null,
              child: Container(
                  // key: SuperTooltip.barrierKey,
                  // decoration: ShapeDecoration(
                  //   shape: ShapeOverlay(
                  //     clipAreaCornerRadius: widget.touchThroughAreaCornerRadius,
                  //     // clipAreaShape: widget.touchThroughAreaShape,
                  //     clipRect: widget.touchThroughArea,
                  //     barrierColor: barrierColor,
                  //     overlayDimensions: widget.overlayDimensions,
                  //   ),
                  // ),
                  ),
            ),
            // ),
          )
        : null;

    blur = showBlur
        ? OverlayEntry(
            builder: (BuildContext context) => FadeTransition(
              opacity: animation,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    // sigmaX: widget.sigmaX,
                    // sigmaY: widget.sigmaY,
                    ),
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
                top: top,
                bottom: bottom,
                left: left,
                right: right,
                target: target,
                // verticalOffset: widget.verticalOffset,
                overlay: overlay,
                margin: widget.minimumOutsideMargin,
                snapsFarAwayHorizontally: widget.snapsFarAwayHorizontally,
                snapsFarAwayVertically: widget.snapsFarAwayVertically,
              ),
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    // child:
                    // GestureDetector(
                    //   onTap: () {
                    //     if (widget.hideTooltipOnTap) {
                    //       _superTooltipController!.hideTooltip();
                    //     }
                    //   },
                    child: Container(
                      key: SuperTooltip.bubbleKey,
                      margin: SuperUtils.getTooltipMargin(
                        arrowLength: widget.arrowLength,
                        distance: widget.distance,
                        preferredDirection: preferredDirection,
                      ),
                      decoration: widget.decoration ??
                          ShapeDecoration(
                            color: backgroundColor,
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
                              arrowBaseWidth: widget.arrowBaseWidth,
                              distance: widget.distance,
                              borderWidth: widget.borderWidth,
                              bottom: bottom,
                              left: left,
                              preferredDirection: preferredDirection,
                              right: right,
                              target: target,
                              top: top,
                              bubbleDimensions: widget.bubbleDimensions,
                              borderColor: Colors.blue,
                            ),
                          ),
                      child: Text(widget.content),
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
    widget.onShow?.call();

    // Already visible.
    if (_entry != null) return;

    _createOverlayEntries();

    await _animationController
        .forward()
        .whenComplete(_superTooltipController!.complete);
  }

  _removeEntries() {
    _entry?.remove();
    _entry = null;
    _barrierEntry?.remove();
    _entry = null;
    blur?.remove();
  }

  _hideTooltip() async {
    widget.onHide?.call();
    await _animationController
        .reverse()
        .whenComplete(_superTooltipController!.complete);

    _removeEntries();
  }
}
