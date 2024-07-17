import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_position_manager.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_text_style.dart';

class Bubble extends StatefulWidget {
  final ElementBox triggerBox;
  final BorderRadiusGeometry? radius;
  final String message;
  final TooltipStyleClass? tooltipStyle;

  const Bubble({
    this.radius = const BorderRadius.all(Radius.circular(0)),
    required this.message,
    required this.triggerBox,
    super.key,
    this.tooltipStyle,
  });

  @override
  State<Bubble> createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) {
    double? width = widget.tooltipStyle?.styler.width;
    double? height = widget.tooltipStyle?.styler.height;
    double? maxWidth = widget.tooltipStyle?.styler.maxWidth ?? 300.00;
    double? maxHeight = widget.tooltipStyle?.styler.maxHeight ?? 200.00;
    return Material(
      color: Colors.transparent,
      child: Opacity(
        opacity: 1.0,
        child: Container(
          height: height,
          width: width,
          constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
          decoration: BoxDecoration(
              borderRadius: widget.radius,
              color: widget.tooltipStyle?.styler.bg?.getColor(context) ??
                  GSTheme.of(context).background100),
          padding:
              widget.tooltipStyle?.styler.padding ?? const EdgeInsets.all(10.0),
          child: Text(
            widget.message,
            textAlign: TextAlign.center,
            style: widget.tooltipStyle?.toolTipTextStyler.textStyle,
          ),
        ),
      ),
    );
  }
}
