import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gss_tooltip/tooltip.dart';

class TooltipPositionDelegate extends SingleChildLayoutDelegate {
  TooltipPositionDelegate({
    required this.snapsFarAwayVertically,
    required this.snapsFarAwayHorizontally,
    required this.preferredDirection,
    required this.constraints,
    required this.margin,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.target,
    required this.overlay,
  });

  final bool snapsFarAwayVertically;
  final bool snapsFarAwayHorizontally;
  final double margin;
  final Offset target;
  final RenderBox? overlay;
  final BoxConstraints constraints;

  final GSTooltipPosition preferredDirection;
  final double? top, bottom, left, right;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    var newConstraints = constraints;

    switch (preferredDirection) {
      case GSTooltipPosition.top:
      case GSTooltipPosition.bottom:
        newConstraints = SuperUtils.verticalConstraints(
          constraints: newConstraints,
          margin: margin,
          bottom: bottom,
          isUp: preferredDirection == GSTooltipPosition.top,
          target: target,
          top: top,
          left: left,
          right: right,
        );
        break;
      case GSTooltipPosition.right:
      case GSTooltipPosition.left:
        newConstraints = SuperUtils.horizontalConstraints(
          constraints: newConstraints,
          margin: margin,
          bottom: bottom,
          isRight: preferredDirection == GSTooltipPosition.right,
          target: target,
          top: top,
          left: left,
          right: right,
        );
        break;
    }

    // TD: This scenerio should likely be avoided in the initial functions
    return newConstraints.copyWith(
      minHeight: newConstraints.minHeight > newConstraints.maxHeight
          ? newConstraints.maxHeight
          : newConstraints.minHeight,
      minWidth: newConstraints.minWidth > newConstraints.maxWidth
          ? newConstraints.maxWidth
          : newConstraints.minWidth,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    switch (preferredDirection) {
      case GSTooltipPosition.top:
      case GSTooltipPosition.bottom:
        final topOffset = preferredDirection == GSTooltipPosition.top
            ? top ?? target.dy - childSize.height
            : target.dy;

        return Offset(
          SuperUtils.leftMostXtoTarget(
            childSize: childSize,
            left: left,
            margin: margin,
            right: right,
            size: size,
            target: target,
          ),
          topOffset,
        );

      case GSTooltipPosition.right:
      case GSTooltipPosition.left:
        final leftOffset = preferredDirection == GSTooltipPosition.left
            ? left ?? target.dx - childSize.width
            : target.dx;
        return Offset(
          leftOffset,
          SuperUtils.topMostYtoTarget(
            bottom: bottom,
            childSize: childSize,
            margin: margin,
            size: size,
            target: target,
            top: top,
          ),
        );
      default:
        throw ArgumentError(preferredDirection);
    }
  }

  @override
  bool shouldRelayout(TooltipPositionDelegate oldDelegate) => true;
}
