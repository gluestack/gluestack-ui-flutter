import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:provider/provider.dart';

class StyleData {
  final BuildContext context;
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

  StyleData(
    this.context, {
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

  StyleData onDark({Color? borderColor, Color? color, TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isDarkMode
        ? StyleData(
            context,
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

  StyleData base(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    return isBaseScreen(context)
        ? StyleData(
            context,
            color: (color ?? this.color),
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData baseLight(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isBaseScreen(context)
        ? StyleData(
            context,
            color: !isDarkMode ? color : this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData baseDark(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isBaseScreen(context)
        ? StyleData(
            context,
            color: isDarkMode ? color : this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData sm(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    return isSmallScreen(context)
        ? StyleData(
            context,
            color: color ?? this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData smLight(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isSmallScreen(context)
        ? StyleData(
            context,
            color: !isDarkMode ? color : this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData smDark(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isSmallScreen(context)
        ? StyleData(
            context,
            color: isDarkMode ? color : this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData md(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    return isMediumScreen(context)
        ? StyleData(
            context,
            color: color ?? this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData mdLight(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isMediumScreen(context)
        ? StyleData(
            context,
            color: !isDarkMode ? color : this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData mdDark(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isMediumScreen(context)
        ? StyleData(
            context,
            color: isDarkMode ? color : this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData lg(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    return isLargeScreen(context)
        ? StyleData(
            context,
            color: color ?? this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData lgLight(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isLargeScreen(context)
        ? StyleData(
            context,
            color: !isDarkMode ? color : this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  StyleData lgDark(
      {double? width,
      double? height,
      Color? borderColor,
      Color? color,
      TextStyle? textStyle}) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).currentTheme == GSThemeMode.dark;
    return isLargeScreen(context)
        ? StyleData(
            context,
            color: isDarkMode ? color : this.color,
            borderColor: borderColor ?? this.borderColor,
            borderRadius: borderRadius,
            width: width ?? this.width,
            height: height ?? this.height,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
            alignment: alignment,
            textStyle: textStyle ?? this.textStyle,
          )
        : this;
  }

  bool isBaseScreen(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return screenWidth < small;
  }

  bool isSmallScreen(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= small;
  }

  bool isMediumScreen(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= medium;
  }

  bool isLargeScreen(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= large;
  }
}

const base = 0;
const small = 360;
const medium = 600;
const large = 960;
