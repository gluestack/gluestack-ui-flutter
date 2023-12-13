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
  final GSBorderWidthToken gsBorderWidthToken;
  final GSFontSizeToken gsFontSizeToken;
  final GSFontWeightsToken gsFontWeightsToken;
  final GSLetterSpacingToken gsLetterSpacingToken;
  final GSLineHeightToken gsLineHeightToken;
  final GSRadiiToken gsRadiiToken;
  final GSSpaceToken gsSpaceToken;
  final GSColorsToken gsColorsToken;

  GluestackTokenConfig({
    this.gsBorderWidthToken = const GSBorderWidthToken(),
    this.gsFontSizeToken = const GSFontSizeToken(),
    this.gsFontWeightsToken = const GSFontWeightsToken(),
    this.gsLetterSpacingToken = const GSLetterSpacingToken(),
    this.gsLineHeightToken = const GSLineHeightToken(),
    this.gsRadiiToken = const GSRadiiToken(),
    this.gsSpaceToken = const GSSpaceToken(),
    this.gsColorsToken = const GSColorsToken(),
  }) {
    getIt.registerSingleton<GSBorderWidthToken>(gsBorderWidthToken);
    getIt.registerSingleton<GSFontSizeToken>(gsFontSizeToken);
    getIt.registerSingleton<GSFontWeightsToken>(gsFontWeightsToken);
    getIt.registerSingleton<GSLetterSpacingToken>(gsLetterSpacingToken);
    getIt.registerSingleton<GSLineHeightToken>(gsLineHeightToken);
    getIt.registerSingleton<GSRadiiToken>(gsRadiiToken);
    getIt.registerSingleton<GSSpaceToken>(gsSpaceToken);
    getIt.registerSingleton<GSColorsToken>(gsColorsToken);
  }
}
