import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class GSTheme extends StatelessWidget {
  const GSTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final GSThemeData data;
  final Widget child;

  static GSThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_GSTheme>()!.data;
  }

  static GSThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_GSTheme>()?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _GSTheme(
      data: data,
      child: child,
    );
  }
}

class _GSTheme extends InheritedTheme {
  const _GSTheme({
    required this.data,
    required super.child,
  });

  final GSThemeData data;

  @override
  bool updateShouldNotify(covariant _GSTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _GSTheme(data: data, child: child);
  }
}

class GSThemeWidget extends StatelessWidget {
  final GSThemeData data;
  final Widget child;
  const GSThemeWidget({
    super.key,
    required this.data,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GSTheme(
      data: data,
      child: child,
    );
  }
}

extension BrightnessExtension on Brightness {
  bool get isLight => this == Brightness.light;

  bool get isDark => this == Brightness.dark;
  Brightness get opposite => isLight ? Brightness.dark : Brightness.light;
}

const standardCurve = Curves.easeInOut;

@immutable
class GSThemeData with Diagnosticable {
  final Brightness brightness;

  factory GSThemeData({
    Brightness? brightness,
  }) {
    brightness ??= Brightness.light;

    return GSThemeData.raw(
      brightness: brightness,
    );
  }

  const GSThemeData.raw({
    required this.brightness,
  });

  static GSThemeData light() {
    return GSThemeData(brightness: Brightness.light);
  }

  static GSThemeData dark() {
    return GSThemeData(brightness: Brightness.dark);
  }

  static GSThemeData lerp(GSThemeData a, GSThemeData b, double t) {
    return GSThemeData.raw(
      brightness: t < 0.5 ? a.brightness : b.brightness,
    );
  }

  GSThemeData copyWith({
    Brightness? brightness,
  }) {
    return GSThemeData.raw(
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty('brightness', brightness));
  }
}
