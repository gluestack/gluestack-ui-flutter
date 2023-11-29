import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/button/button_group.dart';

// GSStyle buttonGroupStyle = GSStyle.fromMap(data: buttonGroupData);
import 'package:gluestack_flutter_pro/widgets/gs_button/button_styles_generated.dart';
class GSButtonGroupStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: buttonGroupStyle.variants!.size!.$xs!,
    GSSizes.$sm: buttonGroupStyle.variants!.size!.$sm!,
    GSSizes.$md: buttonGroupStyle.variants!.size!.$md!,
    GSSizes.$lg: buttonGroupStyle.variants!.size!.$lg!,
    GSSizes.$xl: buttonGroupStyle.variants!.size!.$xl!,
  };

  static Map<GSSpaces, GSStyle> space = {
    GSSpaces.$xs: buttonGroupStyle.variants!.space!.$xs!,
    GSSpaces.$sm: buttonGroupStyle.variants!.space!.$sm!,
    GSSpaces.$md: buttonGroupStyle.variants!.space!.$md!,
    GSSpaces.$lg: buttonGroupStyle.variants!.space!.$lg!,
    GSSpaces.$xl: buttonGroupStyle.variants!.space!.$xl!,
    GSSpaces.$2xl: buttonGroupStyle.variants!.space!.$2xl!,
    GSSpaces.$3xl: buttonGroupStyle.variants!.space!.$3xl!,
    GSSpaces.$4xl: buttonGroupStyle.variants!.space!.$4xl!,
  };
}
