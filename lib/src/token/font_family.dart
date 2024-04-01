
import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var fontFamilyInstance = getIt<GSFontFamilyToken>();

class GSFontFamilyToken {
  final String? $body;
  final String? $heading;

  const GSFontFamilyToken({
    this.$body = 'Roboto',
    this.$heading = 'Roboto',
  });
}

class $GSFontFamily {
  static get $body => fontFamilyInstance.$body;
  static get $heading => fontFamilyInstance.$heading;

  static Map<String, String?> fontFamilyMap = {
    "body": $body,
    "heading": $heading,
  };
}