import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/bubble.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_controller.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_overlay.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_position_manager.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_style.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_text_style.dart';

enum TooltipPosition {
  topStart,
  topCenter,
  topEnd,
  rightStart,
  rightCenter,
  rightEnd,
  bottomStart,
  bottomCenter,
  bottomEnd,
  leftStart,
  leftCenter,
  leftEnd,
}

enum GSTooltipStatus { showing, hidden }

class GSToolTip extends StatefulWidget {
  /// [child] that triggers the tooltip when hovered over.
  final Widget child;

  /// Custom styling for the tooltip.
  final GSStyle? style;

  /// The preferred placement of the tooltip relative to the target widget.
  final ToolTipPlacements placement;

  /// If true, the text will be truncated with an ellipsis if it overflows.
  final bool isTruncated;

  /// The size of the tooltip text.
  final GSToolTipSizes? size;

  /// The message displayed inside the tooltip.
  final String message;

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

  /// [distance] Space between the tooltip and the trigger.
  final double distance;

  /// [appearAnimationDuration] Duration of the appear animation of the modal
  /// The default value is 0 which means it doesn't animate
  final Duration appearAnimationDuration;

  /// [disappearAnimationDuration] Duration of the disappear animation of the modal
  /// The default value is 0 which means it doesn't animate
  final Duration disappearAnimationDuration;

  /// [controller] Controller that allows to show or hide the tooltip
  final GSTooltipController? controller;

  final bool enableNotch;

  const GSToolTip({
    super.key,
    required this.child,
    this.placement = ToolTipPlacements.topLeft,
    this.style,
    this.size,
    required this.message,
    this.bold = false,
    this.highlight = false,
    this.isTruncated = false,
    this.italic = false,
    this.strikeThrough = false,
    this.sub = false,
    this.underline = false,
    this.distance = 10.0,
    this.enableNotch = true,
    this.appearAnimationDuration = const Duration(milliseconds: 250),
    this.disappearAnimationDuration = const Duration(milliseconds: 250),
    this.controller,
  });

  @override
  State<GSToolTip> createState() => _GSToolTipState();
}

class _GSToolTipState extends State<GSToolTip> with WidgetsBindingObserver {
  
  final ElementBox _arrowBox = ElementBox(h: 10.0, w: 16.0);
  ElementBox _overlayBox = ElementBox(h: 0.0, w: 0.0);
  late TooltipPosition? position;
  Duration timeout = Duration.zero;
  OverlayEntry? _overlayEntry;
  OverlayEntry? _overlayEntryHidden;
  GlobalKey<GSTooltipOverlayState>? _overlayKey;
  final GlobalKey _widgetKey = GlobalKey();

  @override
  void didChangeMetrics() {
    _hideOverlay();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    preferredPositionMapping(widget.placement);
    setState(() {});
  }

  void preferredPositionMapping(ToolTipPlacements placement) {
    switch (placement) {
      case ToolTipPlacements.topRight:
        position = TooltipPosition.topStart;
        break;
      case ToolTipPlacements.top:
        position = TooltipPosition.topCenter;
        break;
      case ToolTipPlacements.topLeft:
        position = TooltipPosition.topEnd;
        break;
      case ToolTipPlacements.bottomRight:
        position = TooltipPosition.bottomStart;
        break;
      case ToolTipPlacements.bottom:
        position = TooltipPosition.bottomCenter;
        break;
      case ToolTipPlacements.bottomLeft:
        position = TooltipPosition.bottomEnd;
        break;
      case ToolTipPlacements.leftBottom:
        position = TooltipPosition.leftStart;
        break;
      case ToolTipPlacements.left:
        position = TooltipPosition.leftCenter;
        break;
      case ToolTipPlacements.leftTop:
        position = TooltipPosition.leftEnd;
        break;
      case ToolTipPlacements.rightBottom:
        position = TooltipPosition.rightStart;
        break;
      case ToolTipPlacements.right:
        position = TooltipPosition.rightCenter;
        break;
      case ToolTipPlacements.rightTop:
        position = TooltipPosition.rightEnd;
        break;
      default:
        position = TooltipPosition.topCenter;
        break;
    }
  }

  ElementBox get _screenSize => _getScreenSize();

  ElementBox get _triggerBox => _getTriggerSize();

  void _getHiddenOverlaySize(context) {
    RenderBox box = _widgetKey.currentContext?.findRenderObject() as RenderBox;
    if (mounted) {
      setState(() {
        _overlayBox = ElementBox(
          w: box.size.width,
          h: box.size.height,
        );
        _overlayEntryHidden?.remove();
      });
    }
  }

  void _loadHiddenOverlay(_, tooltipStyle) {
    OverlayState? overlayStateHidden = Overlay.of(context);
    _overlayEntryHidden = OverlayEntry(
      builder: (context) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => _getHiddenOverlaySize(context));
        return Opacity(
          opacity: 0,
          child: Center(
            child: Bubble(
              tooltipStyle: tooltipStyle,
              key: _widgetKey,
              triggerBox: _triggerBox,
              message: widget.message,
            ),
          ),
        );
      },
    );

    if (_overlayEntryHidden != null) {
      overlayStateHidden.insert(_overlayEntryHidden!);
    }
  }

  ElementBox _getTriggerSize() {
    if (mounted) {
      final renderBox = context.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero);
      return ElementBox(
        w: renderBox.size.width,
        h: renderBox.size.height,
        x: offset.dx,
        y: offset.dy,
      );
    }
    _hideOverlay();
    return ElementBox(w: 0, h: 0, x: 0, y: 0);
  }

  ElementBox _getScreenSize() {
    return ElementBox(
      w: MediaQuery.of(context).size.width,
      h: MediaQuery.of(context).size.height,
    );
  }

  void _toggleOverlay(BuildContext context, TooltipStyleClass tooltipStyle) {
    _overlayEntry != null
        ? _hideOverlay()
        : _showOverlay(context, tooltipStyle);
  }

  Future<void> _showOverlay(
      [BuildContext? context, TooltipStyleClass? tooltipStyle]) async {
    context ??= this.context;
    final overlayState = Overlay.of(context);

    ToolTipElementsDisplay toolTipElementsDisplay = PositionManager(
      arrowBox: _arrowBox,
      overlayBox: _overlayBox,
      triggerBox: _triggerBox,
      screenSize: _screenSize,
      distance: widget.distance,
      radius: const Radius.circular(8),
    ).load(preferredPosition: position);

    _overlayKey = GlobalKey<GSTooltipOverlayState>();

    _overlayEntry = OverlayEntry(
      builder: (context) => GSTooltipOverlay(
          key: _overlayKey,
          arrowBox: _arrowBox,
          toolTipElementsDisplay: toolTipElementsDisplay,
          message: widget.message,
          hideOverlay: _hideOverlay,
          triggerBox: _triggerBox,
          showChildAboveOverlay: true,
          enableNotch: widget.enableNotch,
          showModal: true,
          appearAnimationDuration: widget.appearAnimationDuration,
          disappearAnimationDuration: widget.disappearAnimationDuration,
          tooltipStyle: tooltipStyle),
    );

    if (_overlayEntry != null) {
      widget.controller?.notify(GSTooltipStatus.showing);
      overlayState.insert(_overlayEntry!);
    }

    if (timeout > Duration.zero) {
      await Future.delayed(timeout).whenComplete(_hideOverlay);
    }
  }

  Future<void> _hideOverlay() async {
    final state = _overlayKey?.currentState;
    if (state != null) {
      await state.hide();
      _overlayKey = null;
    }
    if (_overlayEntry != null) {
      widget.controller?.notify(GSTooltipStatus.hidden);
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {


    preferredPositionMapping(widget.placement);

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
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _loadHiddenOverlay(context, tooltipStyle));
    WidgetsBinding.instance.addObserver(this);
    widget.controller?.attach(show: _showOverlay, hide: _hideOverlay);

    return MouseRegion(
        onEnter: (_) {
          // print("hi");
          _toggleOverlay(context, tooltipStyle);
        },
        child: widget.child);
  }
}
