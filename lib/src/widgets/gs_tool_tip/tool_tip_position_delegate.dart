import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_tool_tip/tooltip_utils.dart';

class TooltipPositionDelegate extends SingleChildLayoutDelegate {
  TooltipPositionDelegate({
    required this.preferredDirection,
    required this.constraints,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.target,
    required this.overlay,
    required this.childTargetSize,
  });
  final Offset target;
  final RenderBox? overlay;
  final BoxConstraints constraints;
  final Size childTargetSize;

  final GSTooltipPosition preferredDirection;
  final double? top, bottom, left, right;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    var newConstraints = constraints;

    switch (preferredDirection) {
      case GSTooltipPosition.top:
      case GSTooltipPosition.bottom:
        newConstraints = GSUtils.verticalConstraints(
          constraints: newConstraints,
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
        newConstraints = GSUtils.horizontalConstraints(
          constraints: newConstraints,
          bottom: bottom,
          isRight: preferredDirection == GSTooltipPosition.right,
          target: target,
          top: top,
          left: left,
          right: right,
        );
        break;
    }

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
        final topOffset = preferredDirection == GSTooltipPosition.top
            ? top ?? target.dy - childSize.height
            : target.dy;

        return Offset(
          GSUtils.leftMostXtoTarget(
              childSize: childSize,
              left: left,
              right: right,
              size: size,
              target: target,
              childTargetSize: childTargetSize),
          topOffset,
        );

      case GSTooltipPosition.bottom:
        final topOffset = preferredDirection == GSTooltipPosition.bottom
            ? top ?? target.dy + childTargetSize.height
            //  - childSize.height +
            // (childTargetSize.height * 4 )
            : target.dy + childTargetSize.height;

        return Offset(
          GSUtils.leftMostXtoTarget(
              childSize: childSize,
              left: left,
              right: right,
              size: size,
              target: target,
              childTargetSize: childTargetSize),
          topOffset,
        );

      case GSTooltipPosition.right:
        final leftOffset = preferredDirection == GSTooltipPosition.right
            ? left ?? target.dx + childTargetSize.width
            : target.dx + childTargetSize.width;
        return Offset(
          leftOffset,
          GSUtils.topMostYtoTarget(
              bottom: bottom,
              childSize: childSize,
              size: size,
              target: target,
              top: top,
              childTargetSize: childTargetSize),
        );
      case GSTooltipPosition.left:
        final leftOffset = preferredDirection == GSTooltipPosition.left
            ? left ?? target.dx - childSize.width
            : target.dx - childSize.width;
        return Offset(
          leftOffset,
          GSUtils.topMostYtoTarget(
              bottom: bottom,
              childSize: childSize,
              size: size,
              target: target,
              top: top,
              childTargetSize: childTargetSize),
        );
      default:
        throw ArgumentError(preferredDirection);
    }
  }

  @override
  bool shouldRelayout(TooltipPositionDelegate oldDelegate) => true;
}
