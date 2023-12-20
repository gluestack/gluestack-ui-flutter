import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/button/button_text.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';

const GSStyleConfig gsTextConfig =
    GSStyleConfig(componentName: 'ButtonText', ancestorStyle: ['_text']);

GSStyle buttonTextStyle = GSStyle.fromMap(data: textData)
    .merge(GSStyle.fromMap(data: buttonTextData));