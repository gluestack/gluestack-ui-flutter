import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/token/font_weight.dart';
import 'package:gluestack_ui/src/token/line_height.dart';

final getIt = GetIt.instance;

class GluestackProvider extends StatelessWidget {
  final Widget child;
  final GluestackTokenConfig gluestackTokenConfig;
  const GluestackProvider(
      {super.key, required this.child, required this.gluestackTokenConfig});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class GluestackTokenConfig {
  final $GSBorderWidth gsBorderWidth;
  final $GSColors gsColors;
  final $GSFontSize gsFontSize;
  final $GSFontWeights gsFontWeights;
  final $GSLetterSpacing gsLetterSpacing;
  final $GSLineHeight gsLineHeight;
  final $GSRadii gsRadii;
  final $GSSpace gsSpace;

  GluestackTokenConfig({
    this.gsBorderWidth = const $GSBorderWidth(),
    this.gsColors = const $GSColors(),
    this.gsFontSize = const $GSFontSize(),
    this.gsFontWeights = const $GSFontWeights(),
    this.gsLetterSpacing = const $GSLetterSpacing(),
    this.gsLineHeight = const $GSLineHeight(),
    this.gsRadii = const $GSRadii(),
    this.gsSpace = const $GSSpace(),
  }) {
    getIt.registerSingleton<$GSBorderWidth>(gsBorderWidth);
    getIt.registerSingleton<$GSColors>(gsColors);
    getIt.registerSingleton<$GSFontSize>(gsFontSize);
    getIt.registerSingleton<$GSFontWeights>(gsFontWeights);
    getIt.registerSingleton<$GSLetterSpacing>(gsLetterSpacing);
    getIt.registerSingleton<$GSLineHeight>(gsLineHeight);
    getIt.registerSingleton<$GSRadii>(gsRadii);
    getIt.registerSingleton<$GSSpace>(gsSpace);
  }
}
