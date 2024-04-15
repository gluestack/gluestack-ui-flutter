import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsTextConfig =
    GSStyleConfig(componentName: 'ButtonText', ancestorStyle: ['_text']);

GSStyle buttonTextStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().buttonText);

Map getColorMap(BuildContext context) {
  final mapp = {
    'primary500': GSTheme.of(context).primary500,
  };
  return mapp;
}
