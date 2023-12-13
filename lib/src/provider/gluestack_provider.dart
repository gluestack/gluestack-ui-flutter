import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/token/font_weight.dart';
import 'package:gluestack_ui/src/token/line_height.dart';

final getIt = GetIt.instance;

class GluestackProvider extends StatelessWidget {
  final Widget child;
  GluestackTokenConfig? gluestackTokenConfig;
  GluestackProvider(
      {super.key, required this.child, this.gluestackTokenConfig}) {
    gluestackTokenConfig ??= GluestackTokenConfig();
  }

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
    if (!getIt.isRegistered<GSBorderWidthToken>()) {
      getIt.registerSingleton<GSBorderWidthToken>(gsBorderWidthToken);
    }
    if (!getIt.isRegistered<GSFontSizeToken>()) {
      getIt.registerSingleton<GSFontSizeToken>(gsFontSizeToken);
    }
    if (!getIt.isRegistered<GSFontWeightsToken>()) {
      getIt.registerSingleton<GSFontWeightsToken>(gsFontWeightsToken);
    }
    if (!getIt.isRegistered<GSLetterSpacingToken>()) {
      getIt.registerSingleton<GSLetterSpacingToken>(gsLetterSpacingToken);
    }
    if (!getIt.isRegistered<GSLineHeightToken>()) {
      getIt.registerSingleton<GSLineHeightToken>(gsLineHeightToken);
    }
    if (!getIt.isRegistered<GSRadiiToken>()) {
      getIt.registerSingleton<GSRadiiToken>(gsRadiiToken);
    }
    if (!getIt.isRegistered<GSSpaceToken>()) {
      getIt.registerSingleton<GSSpaceToken>(gsSpaceToken);
    }
    if (!getIt.isRegistered<GSColorsToken>()) {
      getIt.registerSingleton<GSColorsToken>(gsColorsToken);
    }
  }
}
