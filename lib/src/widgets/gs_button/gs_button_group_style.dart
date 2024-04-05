import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

GSStyle buttonGroupStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().buttonGroup);

class GSButtonGroupStyle {
  //This code is not used anywhere? TODO: Fix or remove this dead code
  // static Map<GSSizes, GSStyle> size = {
  //   GSSizes.$xs: buttonGroupStyle.variants!.size!.$xs!,
  //   GSSizes.$sm: buttonGroupStyle.variants!.size!.$sm!,
  //   GSSizes.$md: buttonGroupStyle.variants!.size!.$md!,
  //   GSSizes.$lg: buttonGroupStyle.variants!.size!.$lg!,
  //   GSSizes.$xl: buttonGroupStyle.variants!.size!.$xl!,
  // };

//TODO: Bound it from xs to 4xl
static Map<GSSpaces, GSStyle?> space = {
  for (var space in GSSpaces.values)
    if (buttonGroupStyle.variants?.space != null &&
        buttonGroupStyle.variants!.space!.styles.containsKey(space))
      space: buttonGroupStyle.variants!.space!.styles[space],
};

  // static Map<GSSpaces, GSStyle> space = {
  //   GSSpaces.$xs: buttonGroupStyle.variants!.space!.$xs!,
  //   GSSpaces.$sm: buttonGroupStyle.variants!.space!.$sm!,
  //   GSSpaces.$md: buttonGroupStyle.variants!.space!.$md!,
  //   GSSpaces.$lg: buttonGroupStyle.variants!.space!.$lg!,
  //   GSSpaces.$xl: buttonGroupStyle.variants!.space!.$xl!,
  //   GSSpaces.$2xl: buttonGroupStyle.variants!.space!.$2xl!,
  //   GSSpaces.$3xl: buttonGroupStyle.variants!.space!.$3xl!,
  //   GSSpaces.$4xl: buttonGroupStyle.variants!.space!.$4xl!,
  // };
}
