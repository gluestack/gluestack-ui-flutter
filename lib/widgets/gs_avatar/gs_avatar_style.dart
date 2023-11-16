import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar.dart';

GSStyle avatarStyle = GSStyle.fromMap(data: avatarData);


class GSAvatarStyle{
    static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: avatarStyle.variants!.size!.$xs!,
    GSSizes.$sm: avatarStyle.variants!.size!.$sm!,
    GSSizes.$md: avatarStyle.variants!.size!.$md!,
    GSSizes.$lg: avatarStyle.variants!.size!.$lg!,
    GSSizes.$xl: avatarStyle.variants!.size!.$xl!,
    GSSizes.$2xl: avatarStyle.variants!.size!.$2xl!,
  };
}






