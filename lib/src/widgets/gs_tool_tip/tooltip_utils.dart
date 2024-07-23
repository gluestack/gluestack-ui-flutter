import 'dart:async';
import 'dart:math';
import 'package:gluestack_ui/gluestack_ui.dart';

class GSUtils {
  static EdgeInsets getTooltipMargin({
    required double distance,
    double arrowLength = 10,
    required GSTooltipPosition preferredDirection,
  }) {
    const top = 0.0;

    switch (preferredDirection) {
      case GSTooltipPosition.bottom:
        return EdgeInsets.only(top: distance + arrowLength);

      case GSTooltipPosition.top:
        return EdgeInsets.only(bottom: distance + arrowLength, top: top);

      case GSTooltipPosition.left:
        return EdgeInsets.only(right: distance + arrowLength, top: top);

      case GSTooltipPosition.right:
        return EdgeInsets.only(left: distance + arrowLength, top: top);

      default:
        throw ArgumentError(preferredDirection);
    }
  }

  static EdgeInsets getTooltipPadding({
    required CloseButtonType? closeButtonType,
    required double? closeButtonSize,
    required bool showCloseButton,
  }) {
    final top = !showCloseButton
        ? 0.0
        : (closeButtonType == CloseButtonType.inside)
            ? closeButtonSize!
            : 0.0;
    return EdgeInsets.only(top: top);
  }

  static double leftMostXtoTarget({
    required double? left,
    required double? right,
    double margin = 0,
    required Size size,
    required Size childSize,
    required Offset target,
    required Size childTargetSize,
  }) {
    double leftMostXtoTarget;

    if (left != null) {
      leftMostXtoTarget = left;
    } else if (right != null) {
      leftMostXtoTarget = max(
        size.topLeft(Offset.zero).dx + margin,
        size.topRight(Offset.zero).dx - margin - childSize.width - right,
      );
    } else {
      leftMostXtoTarget = max(
        target.dx - childSize.width / 2 + childTargetSize.width / 2,
        min(
          target.dx - childSize.width / 2 + childTargetSize.width / 2,
          size.topRight(Offset.zero).dx - margin - childSize.width,
        ),
      );
    }

    return leftMostXtoTarget;
  }

  static double topMostYtoTarget({
    required double? top,
    required double? bottom,
    double margin = 0,
    required Offset target,
    required Size size,
    required Size childSize,
    required Size childTargetSize,
  }) {
    double topmostYtoTarget;

    if (top != null) {
      topmostYtoTarget = top;
    } else if (bottom != null) {
      topmostYtoTarget = max(
        size.topLeft(Offset.zero).dy + margin,
        size.bottomRight(Offset.zero).dy - margin - childSize.height - bottom,
      );
    } else {
      topmostYtoTarget = max(
        target.dy - childSize.height / 2 + childTargetSize.height / 2,
        min(
          target.dy - childSize.height / 2 + childTargetSize.height / 2,
          size.bottomRight(Offset.zero).dy - margin - childSize.height,
        ),
      );
    }

    return topmostYtoTarget;
  }

  static BoxConstraints horizontalConstraints({
    required BoxConstraints constraints,
    required double? top,
    required double? bottom,
    required double? right,
    required double? left,
    double margin = 0,
    required bool isRight,
    required Offset target,
  }) {
    var maxHeight = constraints.maxHeight;
    var minWidth = constraints.minWidth;
    var maxWidth = constraints.maxWidth;

    if (top != null && bottom != null) {
      maxHeight = maxHeight - (top + bottom);
    } else if ((top != null && bottom == null) ||
        (top == null && bottom != null)) {
      // make sure that the sum of top, bottom + _maxHeight isn't bigger than the screen Height.
      final sideDelta = (top ?? 0.0) + (bottom ?? 0.0) + margin;

      if (maxHeight > maxHeight - sideDelta) {
        maxHeight = maxHeight - sideDelta;
      }
    } else {
      if (maxHeight > maxHeight - 2 * margin) {
        maxHeight = maxHeight - 2 * margin;
      }
    }

    if (isRight) {
      if (right != null) {
        minWidth = maxWidth = maxWidth - right - target.dx;
      } else {
        maxWidth = min(maxWidth, target.dx) - margin;
      }
    } else {
      if (left != null) {
        minWidth = maxWidth = target.dx - left;
      } else {
        maxWidth = min(maxWidth, target.dx) - margin;
      }
    }

    return constraints.copyWith(
      maxHeight: maxHeight,
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
  }

  static BoxConstraints verticalConstraints({
    required BoxConstraints constraints,
    double margin = 0,
    required bool isUp,
    required double? top,
    required double? left,
    required double? right,
    required double? bottom,
    required Offset target,
  }) {
    var minHeight = constraints.minHeight;
    var maxHeight = constraints.maxHeight;
    var maxWidth = constraints.maxWidth;

    if (left != null && right != null) {
      maxWidth = maxWidth - (left + right);
    } else if ((left != null && right == null) ||
        (left == null && right != null)) {
      final sideDelta = (left ?? 0.0) + (right ?? 0.0) + margin;

      if (maxWidth > maxWidth - sideDelta) {
        maxWidth = maxWidth - sideDelta;
      }
    } else {
      if (maxWidth > maxWidth - 2 * margin) {
        maxWidth = maxWidth - 2 * margin;
      }
    }

    if (isUp) {
      if (top != null) {
        minHeight = maxHeight = target.dy - top;
      } else {
        maxHeight = min(maxHeight, target.dy) - margin;
        // TD: clamp minheight
      }
    } else {
      if (bottom != null) {
        minHeight = maxHeight = maxHeight - bottom - target.dy;
      } else {
        maxHeight = min(maxHeight, maxHeight - target.dy) - margin;
        // TD: clamp minheight
      }
    }

    return constraints.copyWith(
      minHeight: minHeight,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class GSTooltipController extends ChangeNotifier {
  late Completer _completer;
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  late Event event;

  Future<void> showTooltip() {
    event = Event.show;
    _completer = Completer();
    notifyListeners();
    return _completer.future.whenComplete(() => _isVisible = true);
  }

  Future<void> hideTooltip() {
    event = Event.hide;
    _completer = Completer();
    notifyListeners();
    return _completer.future.whenComplete(() => _isVisible = false);
  }

  void complete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }
}
