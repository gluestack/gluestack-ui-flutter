import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/corner.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/gs_tool_tip_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/triangle.dart';

/// Loads the arrow from the paint code and applies the correct transformations
/// color, rotation and mirroring
class Arrow extends StatelessWidget {
  final TooltipPosition position;
  final double width;
  final double height;
  final BuildContext context;
  final TooltipStyleClass? tooltipStyle;
  const Arrow({
    required this.position,
    this.width = 15.0,
    this.height = 10.0,
    super.key,
    required this.tooltipStyle,
    required this.context,
  });

  /// Returns either the center triangle or the corner triangle
  CustomPainter? _getElement(bool isArrow) {
    return isArrow
        ? Triangle(
            color: tooltipStyle?.styler.color?.getColor(context) ??
                GSTheme.of(context).background100)
        : Corner(
            color: tooltipStyle?.styler.color?.getColor(context) ??
                GSTheme.of(context).background100);
  }

  /// Applies the transformation to the triangle
  Widget _getTriangle() {
    double scaleX = 1;
    double scaleY = 1;
    bool isArrow = false;
    int quarterTurns = 0;

    switch (position) {
      case TooltipPosition.topStart:
        break;
      case TooltipPosition.topCenter:
        quarterTurns = 0;
        isArrow = true;
        break;
      case TooltipPosition.topEnd:
        scaleX = -1;
        break;
      case TooltipPosition.bottomStart:
        scaleY = -1;
        break;
      case TooltipPosition.bottomCenter:
        quarterTurns = 2;
        isArrow = true;
        break;
      case TooltipPosition.bottomEnd:
        scaleX = -1;
        scaleY = -1;
        break;
      case TooltipPosition.leftStart:
        scaleY = -1;
        quarterTurns = 3;
        break;
      case TooltipPosition.leftCenter:
        quarterTurns = 3;
        isArrow = true;
        break;
      case TooltipPosition.leftEnd:
        quarterTurns = 3;
        break;
      case TooltipPosition.rightStart:
        quarterTurns = 1;
        break;
      case TooltipPosition.rightCenter:
        quarterTurns = 1;
        isArrow = true;
        break;
      case TooltipPosition.rightEnd:
        quarterTurns = 1;
        scaleY = -1;
        break;
    }

    return Transform.scale(
      scaleX: scaleX,
      scaleY: scaleY,
      child: RotatedBox(
        quarterTurns: quarterTurns,
        child: CustomPaint(
          size: Size(width, height),
          painter: _getElement(isArrow),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getTriangle();
  }
}
