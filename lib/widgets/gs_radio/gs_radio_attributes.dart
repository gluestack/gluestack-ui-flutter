import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_token.dart';

class GSRadioAttributes {
  static Map<GSThemeMode, GSRadioCombinationStyle> gsInputCombination = {
    GSThemeMode.light: GSRadioCombinationStyle(

        labelColor: $GSColors.textLight600),
     GSThemeMode.dark: GSRadioCombinationStyle(
     
        labelColor: $GSColors.textDark400)    
  };
}
