import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
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
    Color? resolvedColor;

    Color parseColor(String colorString) {
      String hexColor = colorString.split('(0x')[1].split(')')[0];

      //main stuff
      int value = int.parse(hexColor, radix: 16);

      return Color(value);
    }

    if (isNotEmpty) {
      if (contains('transparent')) {
        resolvedColor = const Color(0x00000000);
      } else if (contains('0xff')) {
        //i.e. color from token most likely or smthin
        resolvedColor = parseColor(this);
      } else {
        //theme clr
        resolvedColor = themeColorMap(context)[this];
      }
    }

    //default color is transparent ish red if unresolved!
    resolvedColor ??= const Color.fromARGB(0, 255, 0, 0);

    return resolvedColor;
  }
}
