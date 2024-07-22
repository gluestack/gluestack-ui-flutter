import 'package:gluestack_ui/gluestack_ui.dart';

/// Calculates the position of the tooltip and the arrow on the screen
/// Verifies if the desired position fits the screen.
/// If it doesn't the position changes automatically.
class PositionManager {
  /// [arrowBox] width, height, position x and y of the arrow.
  final ElementBox arrowBox;

  /// [triggerBox] width, height, position x and y of the trigger.
  final ElementBox triggerBox;

  /// [overlayBox] width, height, position x and y of the overlay.
  final ElementBox overlayBox;

  /// [screenSize] width and height of the current screen.
  final ElementBox screenSize;

  /// [distance] between the tooltip and the trigger button.
  final double distance;

  /// [radius] border radius amount of the tooltip.
  final Radius radius;

  PositionManager({
    required this.arrowBox,
    required this.triggerBox,
    required this.overlayBox,
    required this.screenSize,
    this.distance = 0.0,
    this.radius = Radius.zero,
  });

  ToolTipElementsDisplay _topStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w)).floorToDouble(),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w)).floorToDouble(),
        y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
      ),
      position: TooltipPosition.topStart,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: Radius.zero,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _topCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - _half(arrowBox.w))
            .floorToDouble(),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - _half(overlayBox.w),
        y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
      ),
      position: TooltipPosition.topCenter,
      radius: BorderRadius.all(radius),
    );
  }

  ToolTipElementsDisplay _topEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - arrowBox.w),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - overlayBox.w,
        y: (triggerBox.y - overlayBox.h - distance - arrowBox.h)
            .floorToDouble(),
      ),
      position: TooltipPosition.topEnd,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: Radius.zero,
      ),
    );
  }

  ToolTipElementsDisplay _bottomStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w)).ceilToDouble(),
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w)).ceilToDouble(),
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h,
      ),
      position: TooltipPosition.bottomStart,
      radius: BorderRadius.only(
        topLeft: Radius.zero,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _bottomCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - _half(arrowBox.w))
            .ceilToDouble(),
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - _half(overlayBox.w))
            .ceilToDouble(),
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h,
      ),
      position: TooltipPosition.bottomCenter,
      radius: BorderRadius.all(radius),
    );
  }

  ToolTipElementsDisplay _bottomEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - arrowBox.w),
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - overlayBox.w,
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h,
      ),
      position: TooltipPosition.bottomEnd,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: Radius.zero,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _leftStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x - overlayBox.x - distance - arrowBox.h)
            .floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h)).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.x - overlayBox.w - distance - arrowBox.h,
        y: (triggerBox.y + _half(triggerBox.h)).floorToDouble(),
      ),
      position: TooltipPosition.leftStart,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: Radius.zero,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _leftCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x - overlayBox.x - distance - arrowBox.h)
            .floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h) - _half(arrowBox.w))
            .floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.x - overlayBox.w - distance - arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h) - _half(overlayBox.h),
      ),
      position: TooltipPosition.leftCenter,
      radius: BorderRadius.all(radius),
    );
  }

  ToolTipElementsDisplay _leftEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x - overlayBox.x - distance - arrowBox.h)
            .floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h) - arrowBox.w).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.x - overlayBox.w - distance - arrowBox.h,
        y: (triggerBox.y + _half(triggerBox.h) - overlayBox.h).floorToDouble(),
      ),
      position: TooltipPosition.leftEnd,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: Radius.zero,
      ),
    );
  }

  ToolTipElementsDisplay _rightStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + triggerBox.w + distance).floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h)).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance + arrowBox.h)
            .floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h)).floorToDouble(),
      ),
      position: TooltipPosition.rightStart,
      radius: BorderRadius.only(
        topLeft: Radius.zero,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _rightCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance).floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h) - _half(arrowBox.w))
            .floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance + arrowBox.h)
            .floorToDouble(),
        y: triggerBox.y + _half(triggerBox.h) - _half(overlayBox.h),
      ),
      position: TooltipPosition.rightCenter,
      radius: BorderRadius.all(radius),
    );
  }

  ToolTipElementsDisplay _rightEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + triggerBox.w + distance).floorToDouble(),
        y: triggerBox.y + _half(triggerBox.h) - arrowBox.w,
      ),
      bubble: ElementBox(
          w: overlayBox.w,
          h: overlayBox.h,
          x: (triggerBox.x + triggerBox.w + distance + arrowBox.h)
              .floorToDouble(),
          y: (triggerBox.y + _half(triggerBox.h) - overlayBox.h)),
      position: TooltipPosition.rightEnd,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: Radius.zero,
        bottomRight: radius,
      ),
    );
  }

  double _half(double size) {
    return size * 0.5;
  }

  bool _fitsScreen(ToolTipElementsDisplay el) {
    if (el.bubble.x > 0 &&
        el.bubble.x + el.bubble.w < screenSize.w &&
        el.bubble.y > 0 &&
        el.bubble.y + el.bubble.h < screenSize.h) {
      return true;
    }
    return false;
  }

  /// Tests each possible position until it finds one that fits.
  ToolTipElementsDisplay _firstAvailablePosition() {
    List<ToolTipElementsDisplay Function()> positions = [
      _topCenter,
      _bottomCenter,
      _leftCenter,
      _rightCenter,
      _topStart,
      _topEnd,
      _leftStart,
      _rightStart,
      _leftEnd,
      _rightEnd,
      _bottomStart,
      _bottomEnd,
    ];
    for (var position in positions) {
      if (_fitsScreen(position())) return position();
    }
    return _topCenter();
  }

  /// Load the calculated tooltip position
  ToolTipElementsDisplay load({TooltipPosition? preferredPosition}) {
    ToolTipElementsDisplay elementPosition;

    switch (preferredPosition) {
      case TooltipPosition.topStart:
        elementPosition = _topStart();
        break;
      case TooltipPosition.topCenter:
        elementPosition = _topCenter();
        break;
      case TooltipPosition.topEnd:
        elementPosition = _topEnd();
        break;
      case TooltipPosition.bottomStart:
        elementPosition = _bottomStart();
        break;
      case TooltipPosition.bottomCenter:
        elementPosition = _bottomCenter();
        break;
      case TooltipPosition.bottomEnd:
        elementPosition = _bottomEnd();
        break;
      case TooltipPosition.leftStart:
        elementPosition = _leftStart();
        break;
      case TooltipPosition.leftCenter:
        elementPosition = _leftCenter();
        break;
      case TooltipPosition.leftEnd:
        elementPosition = _leftEnd();
        break;
      case TooltipPosition.rightStart:
        elementPosition = _rightStart();
        break;
      case TooltipPosition.rightCenter:
        elementPosition = _rightCenter();
        break;
      case TooltipPosition.rightEnd:
        elementPosition = _rightEnd();
        break;
      default:
        elementPosition = _topCenter();
        break;
    }

    return _fitsScreen(elementPosition)
        ? elementPosition
        : _firstAvailablePosition();
  }
}

class ElementBox {
  final double w;
  final double h;
  final double x;
  final double y;

  ElementBox({
    required this.w,
    required this.h,
    this.x = 0.0,
    this.y = 0.0,
  });
}

/// [ToolTipElementsDisplay] holds the size, position and style
/// for the tooltip and the arrow.
class ToolTipElementsDisplay {
  final ElementBox bubble;
  final ElementBox arrow;
  final TooltipPosition position;
  final BorderRadiusGeometry? radius;

  ToolTipElementsDisplay({
    required this.bubble,
    required this.arrow,
    required this.position,
    this.radius,
  });
}

// Further adjustment for proper alignment
// x: (triggerBox.x +
//     triggerBox.w -
//     overlayBox.w +
//     _half(
//         overlayBox.w)),

// ToolTipElementsDisplay _topEnd() {
//   return ToolTipElementsDisplay(
//     arrow: ElementBox(
//      w: arrowBox.w,
//     h: arrowBox.h,
//     x: (triggerBox.x + triggerBox.w - _half(arrowBox.w)).floorToDouble(),
//     y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
//     ),
//     bubble: ElementBox(
//       w: overlayBox.w,
//       h: overlayBox.h,
//       x: triggerBox.x - overlayBox.w + _half(triggerBox.w),
//       y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
//     ),
//     position: TooltipPosition.topEnd,
//     radius: BorderRadius.only(
//       topLeft: radius,
//       topRight: radius,
//       bottomLeft: radius,
//       bottomRight: Radius.zero,
//     ),
//   );
// }
