import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/hstack/hstack.dart';

final hstackStyle = GSStyle.fromMap(data: hstackData);

class GSHStackStyle {
  static Map<GSSpaces, GSStyle> space = {
    GSSpaces.$xs: hstackStyle.variants!.space!.$xs!,
    GSSpaces.$sm: hstackStyle.variants!.space!.$sm!,
    GSSpaces.$md: hstackStyle.variants!.space!.$md!,
    GSSpaces.$lg: hstackStyle.variants!.space!.$lg!,
    GSSpaces.$xl: hstackStyle.variants!.space!.$xl!,
    GSSpaces.$2xl: hstackStyle.variants!.space!.$2xl!,
    GSSpaces.$3xl: hstackStyle.variants!.space!.$3xl!,
    GSSpaces.$4xl: hstackStyle.variants!.space!.$4xl!,
  };
}
