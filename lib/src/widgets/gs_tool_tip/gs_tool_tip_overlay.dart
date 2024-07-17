
import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/arrow.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/bubble.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_position_manager.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_text_style.dart';

class GSTooltipOverlay extends StatefulWidget {
  const GSTooltipOverlay({
    super.key,
    this.showModal = true,
    this.showChildAboveOverlay = true,
    required this.toolTipElementsDisplay,
    required this.message,
    required this.hideOverlay,
    required this.triggerBox,
    required this.appearAnimationDuration,
    required this.disappearAnimationDuration,
    this.tooltipStyle,
    required this.arrowBox,
    required this.showArrow,
  });
  final String message;
  final bool showModal;
  final ElementBox arrowBox;
  final bool showChildAboveOverlay;
  final bool showArrow;
  final ToolTipElementsDisplay toolTipElementsDisplay;
  final VoidCallback hideOverlay;
  final ElementBox triggerBox;
  final Duration appearAnimationDuration;
  final Duration disappearAnimationDuration;
  final TooltipStyleClass? tooltipStyle;

  @override
  State<GSTooltipOverlay> createState() => GSTooltipOverlayState();
}

class GSTooltipOverlayState extends State<GSTooltipOverlay> {
  bool closing = false;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => show());
  }

  Future<void> show() async {
    setState(() {
      closing = false;
      opacity = 1;
    });
    await Future.delayed(widget.appearAnimationDuration);
  }

  Future<void> hide() async {
    setState(() {
      closing = true;
      opacity = 0;
    });
    await Future.delayed(widget.disappearAnimationDuration);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: closing
          ? widget.disappearAnimationDuration
          : widget.appearAnimationDuration,
      child: Stack(
        children: [
          if (widget.showModal)
            MouseRegion(
              onExit: (_) {
                widget.hideOverlay();
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          Positioned(
            top: widget.toolTipElementsDisplay.bubble.y,
            left: widget.toolTipElementsDisplay.bubble.x,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: widget.toolTipElementsDisplay.bubble.w,
                maxHeight: widget.toolTipElementsDisplay.bubble.h,
              ),
              child: Bubble(
                triggerBox: widget.triggerBox,
                radius: widget.toolTipElementsDisplay.radius,
                message: widget.message,
                tooltipStyle: widget.tooltipStyle,
              ),
            ),
          ),
          if (widget.showArrow)
            Positioned(
              top: widget.toolTipElementsDisplay.arrow.y,
              left: widget.toolTipElementsDisplay.arrow.x,
              child: Arrow(
                context: context,
                tooltipStyle: widget.tooltipStyle,
                position: widget.toolTipElementsDisplay.position ,
                width: widget.arrowBox.w,
                height: widget.arrowBox.h,
              ),
            ),
          if (widget.showChildAboveOverlay)
            Positioned(
              top: widget.triggerBox.y,
              left: widget.triggerBox.x,
              child: MouseRegion(
                onExit: (_) {
                  widget.hideOverlay();
                },
                child: Container(
                  width: widget.triggerBox.w,
                  height: widget.triggerBox.h,
                  color: Colors.transparent,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
