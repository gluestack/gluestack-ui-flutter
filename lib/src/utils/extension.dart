import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

extension GSExtensions on Object {
  GSActions? get toGSAction => mapToGSActions(this);
  GSVariants? get toGSVariant => mapToGSVariants(this);
  GSSizes? get toGSSize => mapToGSSizes(this);
  GSSpaces? get toGSSpaces => mapToGSSpaces(this);
  GSBorderRadius? get toGSBorderRadius => mapToGSRadius(this);
  GSPlacements? get toGSPlacement => mapToGSPlacement(this);
}

extension ColorExtension on String {
  Color getColor(BuildContext context) {
    final Color? resolvedColor;

    if (isNotEmpty) {
      return themeColorMap(context: context)[this];
    } else {
      //default color is transparent if unresolved!
      resolvedColor = const Color.fromARGB(0, 0, 0, 0);
    }

    return resolvedColor;
  }
}
