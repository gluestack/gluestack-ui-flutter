import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';


abstract class GSThemeExtension<T extends GSThemeExtension<T>> {
  const GSThemeExtension();

  Object get type => T;
  GSThemeExtension<T> copyWith();
  GSThemeExtension<T> lerp(covariant GSThemeExtension<T>? other, double t);
}

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
      child: IconTheme(data: data.iconTheme, child: child),
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
  final Map<Object, GSThemeExtension<dynamic>> extensions;
  // final AccentColor accentColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color inactiveBackgroundColor;
  final Color shadowColor;
  final Color scaffoldBackgroundColor;
  final Color acrylicBackgroundColor;
  final Color micaBackgroundColor;
  final Color menuColor;
  final Color cardColor;
  final Color selectionColor;
  final Duration fasterAnimationDuration;
  final Duration fastAnimationDuration;
  final Duration mediumAnimationDuration;
  final Duration slowAnimationDuration;
  final Curve animationCurve;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final GSColorsToken gsColors;

  // final NavigationPaneThemeData navigationPaneTheme;
  // final BottomNavigationThemeData bottomNavigationTheme;
  // final CheckboxThemeData checkboxTheme;
  // final ContentDialogThemeData dialogTheme;
  // final DividerThemeData dividerTheme;
  // final FocusThemeData focusTheme;
  // final InfoBarThemeData infoBarTheme;
  // final RadioButtonThemeData radioButtonTheme;
  // final ScrollbarThemeData scrollbarTheme;
  // final SliderThemeData sliderTheme;
  // final ToggleButtonThemeData toggleButtonTheme;
  // final ToggleSwitchThemeData toggleSwitchTheme;
  // final TooltipThemeData tooltipTheme;
  // final ButtonThemeData buttonTheme;

  factory GSThemeData({
    Iterable<GSThemeExtension<dynamic>>? extensions,
    Brightness? brightness,
    String? fontFamily,
    Color? activeColor,
    Color? inactiveColor,
    Color? inactiveBackgroundColor,
    Color? scaffoldBackgroundColor,
    Color? acrylicBackgroundColor,
    Color? micaBackgroundColor,
    Color? shadowColor,
    Color? menuColor,
    Color? cardColor,
    Color? selectionColor,
    Duration? fasterAnimationDuration,
    Duration? fastAnimationDuration,
    Duration? mediumAnimationDuration,
    Duration? slowAnimationDuration,
    Curve? animationCurve,
    IconThemeData? iconTheme,
    GSColorsToken? gsColors,
    // BottomNavigationThemeData? bottomNavigationTheme,
    // ButtonThemeData? buttonTheme,
    // CheckboxThemeData? checkboxTheme,
    // ToggleSwitchThemeData? toggleSwitchTheme,
    // ContentDialogThemeData? dialogTheme,
    // TooltipThemeData? tooltipTheme,
    // DividerThemeData? dividerTheme,
    // NavigationPaneThemeData? navigationPaneTheme,
    // RadioButtonThemeData? radioButtonTheme,
    // ToggleButtonThemeData? toggleButtonTheme,
    // SliderThemeData? sliderTheme,
    // InfoBarThemeData? infoBarTheme,
    // FocusThemeData? focusTheme,
    // ScrollbarThemeData? scrollbarTheme,
  }) {
    brightness ??= Brightness.light;
    extensions ??= [];

    final isLight = brightness == Brightness.light;
    fasterAnimationDuration ??= const Duration(milliseconds: 83);
    fastAnimationDuration ??= const Duration(milliseconds: 167);
    mediumAnimationDuration ??= const Duration(milliseconds: 250);
    slowAnimationDuration ??= const Duration(milliseconds: 358);
    animationCurve ??= standardCurve;
    // accentColor ??= Colors.blue;
    activeColor ??= const Color(0xFFFFFFFF);
    inactiveColor ??=
        isLight ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

    inactiveBackgroundColor ??=
        isLight ? const Color(0xFFd6d6d6) : const Color(0xFF292929);
    shadowColor ??= isLight ? const Color(0xFF000000) : const Color(0xFFE0E0E0);
    scaffoldBackgroundColor ??=
        isLight ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
    acrylicBackgroundColor ??=
        isLight ? gsColors?.backgroundLight300 : const Color(0xFF2c2c2c);
    micaBackgroundColor ??= gsColors?.backgroundLight500;
    menuColor ??= isLight ? const Color(0xFFf9f9f9) : const Color(0xFF2c2c2c);
    cardColor ??= gsColors?.primary400;
    selectionColor ??= const Color(0xFF2c2c2c);
    iconTheme ??= isLight
        ? const IconThemeData(color: Color(0xFF000000), size: 18.0)
        : const IconThemeData(color: Color(0xFFFFFFFF), size: 18.0);
    // focusTheme ??= const FocusThemeData();
    // buttonTheme ??= const ButtonThemeData();
    // checkboxTheme ??= const CheckboxThemeData();
    // toggleButtonTheme ??= const ToggleButtonThemeData();
    // toggleSwitchTheme ??= const ToggleSwitchThemeData();

    // dialogTheme ??= const ContentDialogThemeData();
    // tooltipTheme ??= const TooltipThemeData();
    // dividerTheme ??= const DividerThemeData();
    // navigationPaneTheme = NavigationPaneThemeData.fromgsColors(
    //   gsColors: gsColors,
    //   animationCurve: animationCurve,
    //   animationDuration: fastAnimationDuration,
    //   highlightColor: accentColor.defaultBrushFor(brightness),
    // radioButtonTheme ??= const RadioButtonThemeData();
    // sliderTheme ??= const SliderThemeData();
    // infoBarTheme ??= const InfoBarThemeData();
    // scrollbarTheme ??= const ScrollbarThemeData();
    // bottomNavigationTheme ??= const BottomNavigationThemeData();

    return GSThemeData.raw(
      brightness: brightness,
      extensions: _themeExtensionIterableToMap(extensions),
      fasterAnimationDuration: fasterAnimationDuration,
      fastAnimationDuration: fastAnimationDuration,
      mediumAnimationDuration: mediumAnimationDuration,
      slowAnimationDuration: slowAnimationDuration,
      animationCurve: animationCurve,
      //accentColor: accentColor,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      inactiveBackgroundColor: inactiveBackgroundColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      acrylicBackgroundColor: acrylicBackgroundColor ?? const Color(0xFFf9f9f9),
      micaBackgroundColor: micaBackgroundColor ?? const Color(0xFFf9f9f9),
      shadowColor: shadowColor,
      iconTheme: iconTheme,
      menuColor: menuColor,
      cardColor: cardColor ?? const Color.fromARGB(255, 225, 187, 187),
      gsColors: gsColors ??
          const GSColorsToken(rose600: Color.fromARGB(255, 225, 187, 187)),
      selectionColor: selectionColor,
      // bottomNavigationTheme: bottomNavigationTheme,
      // buttonTheme: buttonTheme,
      // checkboxTheme: checkboxTheme,
      // dialogTheme: dialogTheme,
      // dividerTheme: dividerTheme,
      // focusTheme: focusTheme,
      // infoBarTheme: infoBarTheme,
      // navigationPaneTheme: navigationPaneTheme,
      // radioButtonTheme: radioButtonTheme,
      // scrollbarTheme: scrollbarTheme,
      // sliderTheme: sliderTheme,
      // toggleButtonTheme: toggleButtonTheme,
      // toggleSwitchTheme: toggleSwitchTheme,
      // tooltipTheme: tooltipTheme,
    );
  }

  const GSThemeData.raw({
    required this.extensions,
    // required this.accentColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.inactiveBackgroundColor,
    required this.shadowColor,
    required this.fasterAnimationDuration,
    required this.fastAnimationDuration,
    required this.mediumAnimationDuration,
    required this.slowAnimationDuration,
    required this.animationCurve,
    required this.brightness,
    required this.scaffoldBackgroundColor,
    required this.acrylicBackgroundColor,
    required this.micaBackgroundColor,
    required this.iconTheme,
    required this.menuColor,
    required this.cardColor,
    required this.gsColors,
    required this.selectionColor,
    // required this.buttonTheme,
    // required this.checkboxTheme,
    // required this.toggleSwitchTheme,
    // required this.bottomNavigationTheme,
    // required this.dialogTheme,
    // required this.tooltipTheme,
    // required this.dividerTheme,
    // required this.navigationPaneTheme,
    // required this.radioButtonTheme,
    // required this.toggleButtonTheme,
    // required this.sliderTheme,
    // required this.infoBarTheme,
    // required this.focusTheme,
    // required this.scrollbarTheme,
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
      extensions: t < 0.5 ? a.extensions : b.extensions,
      gsColors: const GSColorsToken(),
      activeColor: Color.lerp(a.activeColor, b.activeColor, t)!,
      inactiveColor: Color.lerp(a.inactiveColor, b.inactiveColor, t)!,
      inactiveBackgroundColor:
          Color.lerp(a.inactiveBackgroundColor, b.inactiveBackgroundColor, t)!,
      scaffoldBackgroundColor:
          Color.lerp(a.scaffoldBackgroundColor, b.scaffoldBackgroundColor, t)!,
      acrylicBackgroundColor:
          Color.lerp(a.acrylicBackgroundColor, b.acrylicBackgroundColor, t)!,
      micaBackgroundColor:
          Color.lerp(a.micaBackgroundColor, b.micaBackgroundColor, t)!,
      shadowColor: Color.lerp(a.shadowColor, b.shadowColor, t)!,
      cardColor: Color.lerp(a.cardColor, b.cardColor, t)!,
      fasterAnimationDuration:
          lerpDuration(a.fasterAnimationDuration, b.fasterAnimationDuration, t),
      fastAnimationDuration:
          lerpDuration(a.fastAnimationDuration, b.fastAnimationDuration, t),
      mediumAnimationDuration:
          lerpDuration(a.mediumAnimationDuration, b.mediumAnimationDuration, t),
      slowAnimationDuration:
          lerpDuration(a.slowAnimationDuration, b.slowAnimationDuration, t),
      animationCurve: t < 0.5 ? a.animationCurve : b.animationCurve,
      iconTheme: IconThemeData.lerp(a.iconTheme, b.iconTheme, t),
      menuColor: Color.lerp(a.menuColor, b.menuColor, t)!,
      selectionColor: Color.lerp(a.selectionColor, b.selectionColor, t)!,
      // buttonTheme: ButtonThemeData.lerp(a.buttonTheme, b.buttonTheme, t),
      // checkboxTheme:
      //     CheckboxThemeData.lerp(a.checkboxTheme, b.checkboxTheme, t),
      // toggleSwitchTheme: ToggleSwitchThemeData.lerp(
      //     a.toggleSwitchTheme, b.toggleSwitchTheme, t),

      // dialogTheme: ContentDialogThemeData.lerp(a.dialogTheme, b.dialogTheme, t),
      // tooltipTheme: TooltipThemeData.lerp(a.tooltipTheme, b.tooltipTheme, t),
      // dividerTheme: DividerThemeData.lerp(a.dividerTheme, b.dividerTheme, t),
      // navigationPaneTheme: NavigationPaneThemeData.lerp(
      //     a.navigationPaneTheme, b.navigationPaneTheme, t),
      // radioButtonTheme:
      //     RadioButtonThemeData.lerp(a.radioButtonTheme, b.radioButtonTheme, t),
      // toggleButtonTheme: ToggleButtonThemeData.lerp(
      //     a.toggleButtonTheme, b.toggleButtonTheme, t),
      // sliderTheme: SliderThemeData.lerp(a.sliderTheme, b.sliderTheme, t),
      // infoBarTheme: InfoBarThemeData.lerp(a.infoBarTheme, b.infoBarTheme, t),
      // focusTheme: FocusThemeData.lerp(a.focusTheme, b.focusTheme, t),
      // scrollbarTheme:
      //     ScrollbarThemeData.lerp(a.scrollbarTheme, b.scrollbarTheme, t),
      // bottomNavigationTheme: BottomNavigationThemeData.lerp(
      //     a.bottomNavigationTheme, b.bottomNavigationTheme, t),
    );
  }

  T? extension<T>() => extensions[T] as T?;

  static Map<Object, GSThemeExtension<dynamic>> _themeExtensionIterableToMap(
      Iterable<GSThemeExtension<dynamic>> extensionsIterable) {
    return Map<Object, GSThemeExtension<dynamic>>.unmodifiable(<Object,
        GSThemeExtension<dynamic>>{
      for (final GSThemeExtension<dynamic> extension in extensionsIterable)
        extension.type:
            extension as GSThemeExtension<GSThemeExtension<dynamic>>,
    });
  }

  GSThemeData copyWith({
    Brightness? brightness,
    Iterable<GSThemeExtension<dynamic>>? extensions,
    Color? activeColor,
    Color? inactiveColor,
    Color? inactiveBackgroundColor,
    Color? scaffoldBackgroundColor,
    Color? acrylicBackgroundColor,
    Color? micaBackgroundColor,
    Color? shadowColor,
    Color? menuColor,
    Color? cardColor,
    Color? selectionColor,
    Duration? fasterAnimationDuration,
    Duration? fastAnimationDuration,
    Duration? mediumAnimationDuration,
    Duration? slowAnimationDuration,
    Curve? animationCurve,
    IconThemeData? iconTheme,
    GSColorsToken? gsColors,
    // ButtonThemeData? buttonTheme,
    // BottomNavigationThemeData? bottomNavigationTheme,
    // CheckboxThemeData? checkboxTheme,
    // ToggleSwitchThemeData? toggleSwitchTheme,

    // ContentDialogThemeData? dialogTheme,
    // TooltipThemeData? tooltipTheme,
    // DividerThemeData? dividerTheme,
    // NavigationPaneThemeData? navigationPaneTheme,
    // RadioButtonThemeData? radioButtonTheme,
    // ToggleButtonThemeData? toggleButtonTheme,
    // SliderThemeData? sliderTheme,
    // InfoBarThemeData? infoBarTheme,
    // FocusThemeData? focusTheme,
    // ScrollbarThemeData? scrollbarTheme,
  }) {
    return GSThemeData.raw(
      brightness: brightness ?? this.brightness,
      extensions: extensions != null
          ? _themeExtensionIterableToMap(extensions)
          : this.extensions,
      // accentColor: accentColor ?? this.accentColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      shadowColor: shadowColor ?? this.shadowColor,
      inactiveBackgroundColor:
          inactiveBackgroundColor ?? this.inactiveBackgroundColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      acrylicBackgroundColor:
          acrylicBackgroundColor ?? this.acrylicBackgroundColor,
      micaBackgroundColor: micaBackgroundColor ?? this.micaBackgroundColor,
      menuColor: menuColor ?? this.menuColor,
      cardColor: cardColor ?? this.cardColor,
      selectionColor: selectionColor ?? this.selectionColor,
      fasterAnimationDuration:
          fasterAnimationDuration ?? this.fasterAnimationDuration,
      fastAnimationDuration:
          fastAnimationDuration ?? this.fastAnimationDuration,
      mediumAnimationDuration:
          mediumAnimationDuration ?? this.mediumAnimationDuration,
      slowAnimationDuration:
          slowAnimationDuration ?? this.slowAnimationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      iconTheme: this.iconTheme.merge(iconTheme),
      gsColors: gsColors ?? this.gsColors,
      // buttonTheme: this.buttonTheme.merge(buttonTheme),
      // bottomNavigationTheme:
      //     this.bottomNavigationTheme.merge(bottomNavigationTheme),
      // checkboxTheme: this.checkboxTheme.merge(checkboxTheme),
      // dialogTheme: this.dialogTheme.merge(dialogTheme),
      // dividerTheme: this.dividerTheme.merge(dividerTheme),
      // focusTheme: this.focusTheme.merge(focusTheme),

      // infoBarTheme: this.infoBarTheme.merge(infoBarTheme),
      // navigationPaneTheme: this.navigationPaneTheme.merge(navigationPaneTheme),
      // radioButtonTheme: this.radioButtonTheme.merge(radioButtonTheme),
      // scrollbarTheme: this.scrollbarTheme.merge(scrollbarTheme),
      // sliderTheme: this.sliderTheme.merge(sliderTheme),
      // toggleButtonTheme: this.toggleButtonTheme.merge(toggleButtonTheme),
      // toggleSwitchTheme: this.toggleSwitchTheme.merge(toggleSwitchTheme),
      // tooltipTheme: this.tooltipTheme.merge(tooltipTheme),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(ColorProperty('inactiveBackgroundColor', inactiveBackgroundColor))
      ..add(ColorProperty('shadowColor', shadowColor))
      ..add(ColorProperty('scaffoldBackgroundColor', scaffoldBackgroundColor))
      ..add(ColorProperty('acrylicBackgroundColor', acrylicBackgroundColor))
      ..add(ColorProperty('micaBackgroundColor', micaBackgroundColor))
      ..add(ColorProperty('menuColor', menuColor))
      ..add(ColorProperty('cardColor', cardColor))
      ..add(ColorProperty('selectionColor', selectionColor))
      ..add(EnumProperty('brightness', brightness))
      ..add(DiagnosticsProperty<Duration>(
          'slowAnimationDuration', slowAnimationDuration))
      ..add(DiagnosticsProperty<Duration>(
          'mediumAnimationDuration', mediumAnimationDuration))
      ..add(DiagnosticsProperty<Duration>(
          'fastAnimationDuration', fastAnimationDuration))
      ..add(DiagnosticsProperty<Duration>(
          'fasterAnimationDuration', fasterAnimationDuration))
      ..add(DiagnosticsProperty<Curve>('animationCurve', animationCurve));
  }
}
