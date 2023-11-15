import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio.dart';


GSStyleConfig gsRadioConfig = GSStyleConfig(
    componentName: 'Radio',
    descendantStyle: ['_icon', '_text', '_indicator'],
    ancestorStyle: ['_radio']);


final GSStyle radioStyle =
    GSStyle.fromMap(data: radioData, descendantStyle: gsRadioConfig.descendantStyle);

