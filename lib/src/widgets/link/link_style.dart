import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/link/link.dart';

const GSStyleConfig gsLinkConfig = GSStyleConfig(
  componentName: 'Link',
  descendantStyle: ['_text'],
);

GSStyle linkStyle = GSStyle.fromMap(
    data: linkData, descendantStyle: gsLinkConfig.descendantStyle);
