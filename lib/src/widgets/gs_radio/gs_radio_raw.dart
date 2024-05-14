import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'gs_toggleable.dart';

const Size _size = Size(18.0, 18.0);
const double _kOuterRadius = 8.0;
const double _kInnerRadius = 2.975;

const double _kCupertinoFocusColorOpacity = 0.80;
const double _kCupertinoFocusColorBrightness = 0.69;
const double _kCupertinoFocusColorSaturation = 0.835;

class GSRawRadio<T> extends StatefulWidget {
  const GSRawRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.inactiveColor,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.useCheckmarkStyle = false,
    this.radioSize,
  });

  final T value;

  final T? groupValue;

  final ValueChanged<T?>? onChanged;

  final bool toggleable;

  final bool useCheckmarkStyle;

  final Color? activeColor;

  final Color? inactiveColor;

  final Color? fillColor;

  final Color? focusColor;

  final FocusNode? focusNode;

  final bool autofocus;

  final double? radioSize;

  bool get _selected => value == groupValue;

  @override
  State<GSRawRadio<T>> createState() => _GSRawRadioState<T>();
}

class _GSRawRadioState<T> extends State<GSRawRadio<T>>
    with TickerProviderStateMixin, ToggleableStateMixin {
  bool focused = false;

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  void dispose() {
    // _painter.dispose();
    super.dispose();
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => widget.toggleable;

  @override
  bool? get value => widget._selected;

  void onFocusChange(bool value) {
    if (focused != value) {
      focused = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveActiveColor = widget.activeColor ?? $GSColors.primary0;
    final Color effectiveInactiveColor =
        widget.inactiveColor ?? $GSColors.secondary0;

    final Color effectiveFocusOverlayColor = widget.focusColor ??
        HSLColor.fromColor(
                effectiveActiveColor.withOpacity(_kCupertinoFocusColorOpacity))
            .withLightness(_kCupertinoFocusColorBrightness)
            .withSaturation(_kCupertinoFocusColorSaturation)
            .toColor();

    final Color effectiveActivePressedOverlayColor =
        HSLColor.fromColor(effectiveActiveColor).withLightness(0.45).toColor();

    final Color effectiveFillColor = widget.fillColor ?? $GSColors.white;

    final bool? accessibilitySelected;

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        accessibilitySelected = null;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        accessibilitySelected = widget._selected;
    }

    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: widget._selected,
      selected: accessibilitySelected,
      child: buildToggleable(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onFocusChange: onFocusChange,
        size: _size,
        painter: _RadioPainter(radioSize: widget.radioSize)
          ..focusColor = effectiveFocusOverlayColor
          ..downPosition = downPosition
          ..isFocused = focused
          ..activeColor = downPosition != null
              ? effectiveActivePressedOverlayColor
              : effectiveActiveColor
          ..inactiveColor = effectiveInactiveColor
          ..fillColor = effectiveFillColor
          ..value = value
          ..checkmarkStyle = widget.useCheckmarkStyle,
      ),
    );
  }
}

class _RadioPainter extends ToggleablePainter {
  final double? radioSize;

  _RadioPainter({
    this.radioSize,
  });
  bool? get value => _value;
  bool? _value;
  set value(bool? value) {
    if (_value == value) {
      return;
    }
    _value = value;
    notifyListeners();
  }

  Color get fillColor => _fillColor!;
  Color? _fillColor;
  set fillColor(Color value) {
    if (value == _fillColor) {
      return;
    }
    _fillColor = value;
    notifyListeners();
  }

  bool get checkmarkStyle => _checkmarkStyle;
  bool _checkmarkStyle = false;
  set checkmarkStyle(bool value) {
    if (value == _checkmarkStyle) {
      return;
    }
    _checkmarkStyle = value;
    notifyListeners();
  }

  double get _adjustedOuterRadius {
    if (radioSize == 16) {
      return _kOuterRadius - 1.2;
    } else if (radioSize == 20) {
      return _kOuterRadius + 1.2;
    }
    return _kOuterRadius;
  }

  double get _adjustedInnerRadius {
    if (radioSize == 16) {
      return _kInnerRadius - 1.2;
    } else if (radioSize == 20) {
      return _kInnerRadius + 1.2;
    }
    return _kInnerRadius;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = (Offset.zero & size).center;

    final Paint paint = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.1;

    canvas.drawCircle(center, _adjustedOuterRadius, paint);

    paint.style = PaintingStyle.stroke;
    paint.color = CupertinoColors.inactiveGray;
    canvas.drawCircle(center, _adjustedOuterRadius, paint);

    if (value ?? false) {
      paint.style = PaintingStyle.fill;
      paint.color = fillColor;
      canvas.drawCircle(center, _adjustedOuterRadius, paint);
      paint.color = activeColor;
      canvas.drawCircle(center, _adjustedOuterRadius - 2, paint);
      paint.color = fillColor;
      canvas.drawCircle(center, _adjustedInnerRadius + 0.5, paint);
    }

    if (isFocused) {
      paint.style = PaintingStyle.stroke;
      paint.color = focusColor;
      paint.strokeWidth = 3.0;
      canvas.drawCircle(center, _adjustedOuterRadius + 1.5, paint);
    }
  }
}
