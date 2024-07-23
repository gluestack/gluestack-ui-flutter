import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class BubbleShape extends ShapeBorder {
  const BubbleShape({
    required this.preferredDirection,
    required this.target,
    required this.distance,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.bubbleDimensions,
    required this.enableNotch,
    this.arrowBaseWidth = 10,
    required this.childTargetSize,
    this.tooltipColor,
  });

  final Offset target;
  final double distance;
  final double? left, top, right, bottom;
  final GSTooltipPosition preferredDirection;
  final EdgeInsetsGeometry bubbleDimensions;
  final bool enableNotch;
  final double arrowBaseWidth;
  final Size childTargetSize;
  final Color? tooltipColor;

  @override
  EdgeInsetsGeometry get dimensions => bubbleDimensions;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..fillType = PathFillType.evenOdd
    ..addPath(getOuterPath(rect), Offset.zero);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    late double topLeftRadius,
        topRightRadius,
        bottomLeftRadius,
        bottomRightRadius;

    Path getLeftTopPath(Rect rect) => Path()
      ..moveTo(rect.left, rect.bottom - bottomLeftRadius)
      ..lineTo(rect.left, rect.top + topLeftRadius)
      ..arcToPoint(
        Offset(rect.left + topLeftRadius, rect.top),
        radius: Radius.circular(topLeftRadius),
      )
      ..lineTo(rect.right - topRightRadius, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + topRightRadius),
        radius: Radius.circular(topRightRadius),
        clockwise: true,
      );

    Path getBottomRightPath(Rect rect) => Path()
      ..moveTo(rect.left + bottomLeftRadius, rect.bottom)
      ..lineTo(rect.right - bottomRightRadius, rect.bottom)
      ..arcToPoint(
        Offset(rect.right, rect.bottom - bottomRightRadius),
        radius: Radius.circular(bottomRightRadius),
        clockwise: false,
      )
      ..lineTo(rect.right, rect.top + topRightRadius)
      ..arcToPoint(
        Offset(rect.right - topRightRadius, rect.top),
        radius: Radius.circular(topRightRadius),
        clockwise: false,
      );

    topLeftRadius = (left == 0 || top == 0) ? 0.0 : 10;
    topRightRadius = (right == 0 || top == 0) ? 0.0 : 10;
    bottomLeftRadius = (left == 0 || bottom == 0) ? 0.0 : 10;
    bottomRightRadius = (right == 0 || bottom == 0) ? 0.0 : 10;
    var arrowLength = 10;
    switch (preferredDirection) {
      case GSTooltipPosition.bottom:
        return getBottomRightPath(rect)
          ..lineTo(
            min(
              max(
                target.dx + childTargetSize.width / 2 + arrowBaseWidth / 2,
                rect.left + arrowBaseWidth,
              ),
              rect.right - topRightRadius,
            ),
            rect.top,
          )
          ..lineTo(
            target.dx + childTargetSize.width / 2,
            enableNotch ? rect.top - arrowLength : rect.top,
          )
          ..lineTo(
            max(
              min(
                target.dx + childTargetSize.width / 2 - arrowBaseWidth / 2,
                rect.right - topLeftRadius - arrowBaseWidth,
              ),
              rect.left + topLeftRadius,
            ),
            rect.top,
          )
          ..lineTo(rect.left + topLeftRadius, rect.top)
          ..arcToPoint(
            Offset(rect.left, rect.top + topLeftRadius),
            radius: Radius.circular(topLeftRadius),
            clockwise: false,
          )
          ..lineTo(rect.left, rect.bottom - bottomLeftRadius)
          ..arcToPoint(
            Offset(rect.left + bottomLeftRadius, rect.bottom),
            radius: Radius.circular(bottomLeftRadius),
            clockwise: false,
          );

      case GSTooltipPosition.top:
        return getLeftTopPath(rect)
          ..lineTo(rect.right, rect.bottom - bottomRightRadius)
          ..arcToPoint(
            Offset(rect.right - bottomRightRadius, rect.bottom),
            radius: Radius.circular(bottomRightRadius),
            clockwise: true,
          )
          ..lineTo(
            min(
              max(
                target.dx + childTargetSize.width / 2 + arrowBaseWidth / 2,
                rect.left + bottomLeftRadius + arrowBaseWidth,
              ),
              rect.right - bottomRightRadius,
            ),
            rect.bottom,
          )
          ..lineTo(
            target.dx + childTargetSize.width / 2,
            enableNotch ? rect.bottom + arrowLength : rect.bottom,
          )
          ..lineTo(
            max(
              min(
                target.dx + childTargetSize.width / 2 - arrowBaseWidth / 2,
                rect.right - bottomRightRadius - arrowBaseWidth,
              ),
              rect.left + bottomLeftRadius,
            ),
            rect.bottom,
          )
          ..lineTo(rect.left + bottomLeftRadius, rect.bottom)
          ..arcToPoint(
            Offset(rect.left, rect.bottom - bottomLeftRadius),
            radius: Radius.circular(bottomLeftRadius),
            clockwise: true,
          )
          ..lineTo(rect.left, rect.top + topLeftRadius)
          ..arcToPoint(
            Offset(rect.left + topLeftRadius, rect.top),
            radius: Radius.circular(topLeftRadius),
            clockwise: true,
          );

      case GSTooltipPosition.left:
        return getLeftTopPath(rect)
          ..lineTo(
            rect.right,
            max(
              min(
                target.dy + childTargetSize.height / 2 - arrowBaseWidth / 2,
                rect.bottom - bottomRightRadius - arrowBaseWidth,
              ),
              rect.top + topRightRadius,
            ),
          )
          ..lineTo(
            enableNotch ? rect.right + arrowLength : rect.right,
            target.dy + childTargetSize.height / 2,
          )
          ..lineTo(
            rect.right,
            min(
              target.dy + childTargetSize.height / 2 + arrowBaseWidth / 2,
              rect.bottom - bottomRightRadius,
            ),
          )
          ..lineTo(rect.right, rect.bottom - bottomRightRadius)
          ..arcToPoint(
            Offset(rect.right - bottomRightRadius, rect.bottom),
            radius: Radius.circular(bottomRightRadius),
            clockwise: true,
          )
          ..lineTo(rect.left + bottomLeftRadius, rect.bottom)
          ..arcToPoint(
            Offset(rect.left, rect.bottom - bottomLeftRadius),
            radius: Radius.circular(bottomLeftRadius),
            clockwise: true,
          );

      case GSTooltipPosition.right:
        return getBottomRightPath(rect)
          ..lineTo(rect.left + topLeftRadius, rect.top)
          ..arcToPoint(
            Offset(rect.left, rect.top + topLeftRadius),
            radius: Radius.circular(topLeftRadius),
            clockwise: false,
          )
          ..lineTo(
            rect.left,
            max(
              min(
                target.dy + childTargetSize.height / 2 - arrowBaseWidth / 2,
                rect.bottom - bottomLeftRadius - arrowBaseWidth,
              ),
              rect.top + topLeftRadius,
            ),
          )
          ..lineTo(
            enableNotch ? rect.left - arrowLength : rect.left,
            target.dy + childTargetSize.height / 2,
          )
          ..lineTo(
            rect.left,
            min(
              target.dy + childTargetSize.height / 2 + arrowBaseWidth / 2,
              rect.bottom - bottomLeftRadius,
            ),
          )
          ..lineTo(rect.left, rect.bottom - bottomLeftRadius)
          ..arcToPoint(
            Offset(rect.left + bottomLeftRadius, rect.bottom),
            radius: Radius.circular(bottomLeftRadius),
            clockwise: false,
          );

      default:
        throw ArgumentError(preferredDirection);
    }
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = tooltipColor ?? Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return BubbleShape(
      preferredDirection: preferredDirection,
      target: target,
      distance: distance,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      bubbleDimensions: bubbleDimensions,
      enableNotch: enableNotch,
      arrowBaseWidth: arrowBaseWidth,
      childTargetSize: childTargetSize,
    );
  }
}
