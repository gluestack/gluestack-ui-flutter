import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/link/link.dart';


GSStyleConfig gsLinkConfig =
    GSStyleConfig(componentName: 'Link', descendantStyle: ['_text']);


GSStyle linkStyle = GSStyle.fromMap(data: linkData,descendantStyle: gsLinkConfig.descendantStyle);


