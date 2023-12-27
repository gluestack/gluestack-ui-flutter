import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/theme/config/button/button.dart';
import 'package:gluestack_ui/src/theme/config/button/button_text.dart';
import 'package:gluestack_ui/src/token/font_weight.dart';
import 'package:gluestack_ui/src/token/line_height.dart';
import 'package:gluestack_ui/src/token/screen_breakpoint.dart';

final getIt = GetIt.instance;
late Map<String, dynamic> buttonGsConfig;
late Map<String, dynamic> buttonTextGsConfig;

class GluestackProvider extends StatelessWidget {
  final Widget child;
  GluestackTokenConfig? gluestackTokenConfig;
  GSComponentConfig? gsComponentConfig;
  GluestackProvider(
      {super.key,
      required this.child,
      this.gluestackTokenConfig,
      this.gsComponentConfig}) {
    gluestackTokenConfig ??= GluestackTokenConfig();
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class GSComponentConfig {
  final Map<String, dynamic>? button;
  final Map<String, dynamic>? buttonText;
  GSComponentConfig({this.button, this.buttonText}) {
    buttonGsConfig = helper(buttonData, button);
    buttonTextGsConfig = helper(buttonTextData, buttonText);
  }

  Map<String, dynamic> helper(
      Map<String, dynamic> base, Map<String, dynamic>? custom) {
    return custom ?? base;
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
  final GSScreenBreakpointToken gsScreenBreakpointToken;

  GluestackTokenConfig({
    this.gsBorderWidthToken = const GSBorderWidthToken(),
    this.gsFontSizeToken = const GSFontSizeToken(),
    this.gsFontWeightsToken = const GSFontWeightsToken(),
    this.gsLetterSpacingToken = const GSLetterSpacingToken(),
    this.gsLineHeightToken = const GSLineHeightToken(),
    this.gsRadiiToken = const GSRadiiToken(),
    this.gsSpaceToken = const GSSpaceToken(),
    this.gsColorsToken = const GSColorsToken(),
    this.gsScreenBreakpointToken = const GSScreenBreakpointToken(),
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
    if (!getIt.isRegistered<GSScreenBreakpointToken>()) {
      getIt.registerSingleton<GSScreenBreakpointToken>(gsScreenBreakpointToken);
    }
  }
}
