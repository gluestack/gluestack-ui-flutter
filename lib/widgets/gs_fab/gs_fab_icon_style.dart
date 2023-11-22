import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/fab/icon.dart';
import 'package:gluestack_flutter_pro/theme/config/icon/icon.dart';

GSStyleConfig gsfabIconConfig =
    GSStyleConfig(componentName: 'FabIcon', ancestorStyle: ['_icon']);

GSStyle fabIconStyle =
    GSStyle.fromMap(data: iconData).merge(GSStyle.fromMap(data: fabIconData));


class GSFabIconStyle{
    static Map<GSSizes, GSStyle?> size = {
    GSSizes.$2xs: fabIconStyle.variants?.size?.$2xs,
    GSSizes.$xs: fabIconStyle.variants?.size?.$xs,
    GSSizes.$sm: fabIconStyle.variants?.size?.$sm,
    GSSizes.$md: fabIconStyle.variants?.size?.$md,
    GSSizes.$lg: fabIconStyle.variants?.size?.$lg,
    GSSizes.$xl:fabIconStyle.variants?.size?.$xl,
  };
}