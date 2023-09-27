import 'package:flutter/material.dart';

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
}
