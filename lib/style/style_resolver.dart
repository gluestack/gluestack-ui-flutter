import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/generated_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:provider/provider.dart';

GSGeneratedStyle styleResolver(BuildContext context,
    {GSGeneratedStyle? variantStyle,
    GSGeneratedStyle? size,
    GSGeneratedStyle? inlineStyle}) {
  final theme = Provider.of<ThemeProvider>(context).currentTheme;
  if (theme == GSThemeMode.dark) {
    return GSGeneratedStyle(
      color: inlineStyle?.dark?.color ??
          inlineStyle?.color ??
          variantStyle?.dark?.color ??
          variantStyle?.dark!.color,
      borderColor: inlineStyle?.dark?.borderColor ??
          inlineStyle?.borderColor ??
          variantStyle?.dark?.borderColor ??
          variantStyle?.dark!.borderColor,
      padding:
          inlineStyle?.dark?.padding ?? inlineStyle?.padding ?? size!.padding,
      borderWidth:
          inlineStyle?.dark?.borderWidth ?? inlineStyle?.borderWidth ?? 1.0,
      borderRadius: inlineStyle?.dark?.borderRadius ??
          inlineStyle?.borderRadius ??
          size!.borderRadius,
    );
  }
  return GSGeneratedStyle(
    color: inlineStyle?.color ?? variantStyle?.color ?? variantStyle!.color,
    borderColor: inlineStyle?.borderColor ??
        variantStyle?.borderColor ??
        variantStyle!.borderColor,
    padding: inlineStyle?.padding ?? size!.padding,
    borderWidth: inlineStyle?.borderWidth ?? 1.0,
    borderRadius: inlineStyle?.borderRadius ?? size!.borderRadius,
  );
}
