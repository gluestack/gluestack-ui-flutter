import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_content_style.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_style.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_text_style.dart';

class GSToolTip extends StatefulWidget {
  final Widget child;
  final GSStyle? style;
  final GSToolTipPlacements placement;
  final bool isTruncated;
  GSToolTipSizes? size;

  /// If `true`, renders the heading text in a bold font weight. Defaults to `false`.
  final bool bold;

  /// If `true`, applies an italic font style to the heading text. Defaults to `false`.
  final bool italic;

  /// If `true`, adds an underline decoration to the heading text. Defaults to `false`.
  final bool underline;

  /// If `true`, applies a strikethrough decoration to the heading text. Defaults to `false`.
  final bool strikeThrough;

  /// If `true`, applies a highlight effect to the heading text. Defaults to `false`.
  final bool highlight;

  /// Indicates if the heading should be styled as a subtitle or secondary text,
  /// potentially applying a smaller font size and adjusted line height. Defaults to `false`.
  final bool sub;

   GSToolTip(
      {super.key,
      required this.child,
      required this.placement,
      this.style,
      this.size,
      this.bold = false,
      this.highlight = false,
      this.isTruncated = false,
      this.italic = false,
      this.strikeThrough = false,
      this.sub = false,
      this.underline = false});

  @override
  State<GSToolTip> createState() => _GSToolTipState();
}

class _GSToolTipState extends State<GSToolTip> {
  // OverlayEntry? _overlayEntry;

  // void _showTooltip(BuildContext context) {
  //   final renderBox = context.findRenderObject() as RenderBox;
  //   final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  //   final target = renderBox.localToGlobal(Offset.zero, ancestor: overlay) &
  //       renderBox.size;

  //   _overlayEntry = OverlayEntry(
  //     builder: (context) {
  //       return Stack(
  //         children: [
  //           Positioned(
  //             left: target.left,
  //             top: target.top,
  //             width: target.width,
  //             height: target.height,
  //             child: MouseRegion(
  //               onExit: (_) => _hideTooltip(),
  //               child: Row(
  //                 crossAxisAlignment:
  //                     widget.placement == GSToolTipPlacements.leftTop ||
  //                             widget.placement == GSToolTipPlacements.left ||
  //                             widget.placement == GSToolTipPlacements.leftBottom
  //                         ? CrossAxisAlignment.start
  //                         : CrossAxisAlignment.end,
  //                 children: _buildTooltip(context),
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );

  //   Overlay.of(context).insert(_overlayEntry!);
  // }

  // List<Widget> _buildTooltip(BuildContext context) {
  //   List<Widget> children = [];

  //   switch (widget.placement) {
  //     case GSToolTipPlacements.topLeft:
  //     case GSToolTipPlacements.top:
  //     case GSToolTipPlacements.topRight:
  //       children.add(Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: widget.placement == GSToolTipPlacements.topLeft
  //             ? CrossAxisAlignment.start
  //             : widget.placement == GSToolTipPlacements.topRight
  //                 ? CrossAxisAlignment.end
  //                 : CrossAxisAlignment.center,
  //         children: [
  //           _buildTooltipContent(),
  //           SizedBox(height: 4),
  //           widget.child,
  //         ],
  //       ));
  //       break;
  //     case GSToolTipPlacements.leftTop:
  //     case GSToolTipPlacements.left:
  //     case GSToolTipPlacements.leftBottom:
  //       children.addAll([
  //         _buildTooltipContent(),
  //         SizedBox(width: 4),
  //         widget.child,
  //       ]);
  //       break;
  //     case GSToolTipPlacements.bottomLeft:
  //     case GSToolTipPlacements.bottom:
  //     case GSToolTipPlacements.bottomRight:
  //       children.add(Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: widget.placement == GSToolTipPlacements.bottomLeft
  //             ? CrossAxisAlignment.start
  //             : widget.placement == GSToolTipPlacements.bottomRight
  //                 ? CrossAxisAlignment.end
  //                 : CrossAxisAlignment.center,
  //         children: [
  //           widget.child,
  //           SizedBox(height: 4),
  //           _buildTooltipContent(),
  //         ],
  //       ));
  //       break;
  //     case GSToolTipPlacements.rightTop:
  //     case GSToolTipPlacements.right:
  //     case GSToolTipPlacements.rightBottom:
  //       children.addAll([
  //         widget.child,
  //         SizedBox(width: 4),
  //         _buildTooltipContent(),
  //       ]);
  //       break;
  //   }

  //   return children;
  // }

  // Widget _buildTooltipContent() {
  //   return Material(
  //     color: Colors.transparent,
  //     child: Container(
  //       padding: EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         color: Colors.blueAccent,
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Text(
  //         "hiii",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  // void _hideTooltip() {
  //   _overlayEntry?.remove();
  //   _overlayEntry = null;
  // }

  @override
  Widget build(BuildContext context) {
    final textSize = widget.size ?? toolTipTextStyle.props?.size;
    final subFontSize = toolTipTextStyle.variants?.sub?.textStyle?.fontSize;
    // final subLineHeight = toolTipTextStyle.variants?.sub?.textStyle?.height;

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

    GSConfigStyle toolTipContentStyler = resolveStyles(
      context: context,
      styles: [toolTipContentStyle],
      inlineStyle: widget.style,
    );

    final currentTextStyle = toolTipTextStyler.textStyle?.copyWith(
      color: toolTipTextStyler.color?.getColor(context),
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
    );
    // print(toolTipTextStyler);
    // print(currentTextStyle);
    // print(gsToolTipTextConfig);

    return Tooltip(
      message: 'This',
      height: 24,
      verticalOffset: -40,
      preferBelow: true,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.green,
          margin: EdgeInsets.all(20),
          child: Text("hiiiii")),
    );
  }
}
