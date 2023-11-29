import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';

import 'package:gluestack_flutter_pro/theme/config/button/button_icon.dart';
import 'package:gluestack_flutter_pro/theme/config/icon/icon.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

GSStyleConfig gsButtonIconStyle =
    GSStyleConfig(componentName: 'ButtonIcon', ancestorStyle: ['_icon']);
GSStyle buttonIconStyle = GSStyle.fromMap(data: iconData).merge(GSStyle.fromMap(data: buttonIconData));



