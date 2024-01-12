import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

final formErrorTextStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().formErrorText);
