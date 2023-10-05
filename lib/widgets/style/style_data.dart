import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:provider/provider.dart';

class StyleData {
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final TextStyle? textStyle;

  const StyleData({
    this.color,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
    this.borderWidth,
    this.padding,
    this.margin,
    this.alignment,
    this.textStyle,
  });

  StyleData onDark(BuildContext context,
      {Color? borderColor, Color? color, TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isDarkMode
        ? StyleData(
            color: color ?? this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width,
            height: height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }
}
