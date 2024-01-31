import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Typography with Diagnosticable {
  final TextStyle? display;
  final TextStyle? titleLarge;
  final TextStyle? title;
  final TextStyle? subtitle;
  final TextStyle? bodyLarge;
  final TextStyle? bodyStrong;
  final TextStyle? body;
  final TextStyle? caption;

  const Typography.raw({
    this.display,
    this.titleLarge,
    this.title,
    this.subtitle,
    this.bodyLarge,
    this.bodyStrong,
    this.body,
    this.caption,
  });

  factory Typography.fromBrightness({
    Brightness? brightness,
    Color? color,
  }) {
    assert(
      brightness != null || color != null,
      'Either brightness or color must be provided',
    );
    color ??= brightness == Brightness.light
        ? const Color(0xE4000000)
        : const Color(0xFFFFFFFF);
    return Typography.raw(
      display: TextStyle(
        fontSize: 68,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 40,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      title: TextStyle(
        fontSize: 28,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      subtitle: TextStyle(
        fontSize: 20,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.normal,
      ),
      bodyStrong: TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      body: TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        fontSize: 12,
        color: color,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static Typography lerp(Typography? a, Typography? b, double t) {
    return Typography.raw(
      display: TextStyle.lerp(a?.display, b?.display, t),
      titleLarge: TextStyle.lerp(a?.titleLarge, b?.titleLarge, t),
      title: TextStyle.lerp(a?.title, b?.title, t),
      subtitle: TextStyle.lerp(a?.subtitle, b?.subtitle, t),
      bodyLarge: TextStyle.lerp(a?.bodyLarge, b?.bodyLarge, t),
      bodyStrong: TextStyle.lerp(a?.bodyStrong, b?.bodyStrong, t),
      body: TextStyle.lerp(a?.body, b?.body, t),
      caption: TextStyle.lerp(a?.caption, b?.caption, t),
    );
  }

  Typography merge(Typography? typography) {
    if (typography == null) return this;
    return Typography.raw(
      display: typography.display ?? display,
      titleLarge: typography.titleLarge ?? titleLarge,
      title: typography.title ?? title,
      subtitle: typography.subtitle ?? subtitle,
      bodyLarge: typography.bodyLarge ?? bodyLarge,
      bodyStrong: typography.bodyStrong ?? bodyStrong,
      body: typography.body ?? body,
      caption: typography.caption ?? caption,
    );
  }

  Typography apply({
    String? fontFamily,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    Color? displayColor,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
  }) {
    return Typography.raw(
      display: display?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      titleLarge: titleLarge?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      title: title?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      subtitle: subtitle?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyLarge: bodyLarge?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyStrong: bodyStrong?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      body: body?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      caption: caption?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<TextStyle>('header', display))
      ..add(DiagnosticsProperty<TextStyle>('titleLarge', titleLarge))
      ..add(DiagnosticsProperty<TextStyle>('title', title))
      ..add(DiagnosticsProperty<TextStyle>('subtitle', subtitle))
      ..add(DiagnosticsProperty<TextStyle>('bodyLarge', bodyLarge))
      ..add(DiagnosticsProperty<TextStyle>('bodyStrong', bodyStrong))
      ..add(DiagnosticsProperty<TextStyle>('body', body))
      ..add(DiagnosticsProperty<TextStyle>('caption', caption));
  }
}
