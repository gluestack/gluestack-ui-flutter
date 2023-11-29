import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/vstack/vstack.dart';

GSStyleConfig gsVStackConfig = GSStyleConfig(componentName: 'VStack');

final vstackStyle = GSStyle.fromMap(data: vStackData);

class GSVStackStyle {
  static Map<GSSpaces, GSStyle> space = {
    GSSpaces.$xs: vstackStyle.variants!.space!.$xs!,
    GSSpaces.$sm: vstackStyle.variants!.space!.$sm!,
    GSSpaces.$md: vstackStyle.variants!.space!.$md!,
    GSSpaces.$lg: vstackStyle.variants!.space!.$lg!,
    GSSpaces.$xl: vstackStyle.variants!.space!.$xl!,
    GSSpaces.$2xl: vstackStyle.variants!.space!.$2xl!,
    GSSpaces.$3xl: vstackStyle.variants!.space!.$3xl!,
    GSSpaces.$4xl: vstackStyle.variants!.space!.$4xl!,
  };
}
