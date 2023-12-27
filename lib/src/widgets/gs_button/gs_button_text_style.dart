import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/button/button_text.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';

const GSStyleConfig gsTextConfig =
    GSStyleConfig(componentName: 'ButtonText', ancestorStyle: ['_text']);

GSStyle buttonTextStyle = GSStyle.fromMap(data: textData)
    .merge(GSStyle.fromMap(data: buttonTextGsConfig));

GSStyle baseStyle = GSStyle(
  color: buttonTextStyle.color,
  textStyle: buttonTextStyle.textStyle,
  dark: buttonTextStyle.dark,
);

class GSButtonTextStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$xs: baseStyle.merge(buttonTextStyle.variants?.size?.$xs),
    GSSizes.$sm: baseStyle.merge(buttonTextStyle.variants?.size?.$sm),
    GSSizes.$md: baseStyle.merge(buttonTextStyle.variants?.size?.$md),
    GSSizes.$lg: baseStyle.merge(buttonTextStyle.variants?.size?.$lg),
  };
}
