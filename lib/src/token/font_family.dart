import 'package:gluestack_ui/src/provider/gluestack_provider.dart';



class GSFontFamilyToken {
  final String? $body;
  final String? $heading;

  const GSFontFamilyToken({
    this.$body = 'Roboto',
    this.$heading = 'Roboto',
  });
}

class $GSFontFamily {
  static get $body => getIt<GSFontFamilyToken>().$body;
  static get $heading => getIt<GSFontFamilyToken>().$heading;

  late Map<String, String?> fontFamilyMap;

  $GSFontFamily() {
    fontFamilyMap = {
      "body": $body,
      "heading": $heading,
    };
  }

  Map<String, String?> getFontFamilyMap() {
    return fontFamilyMap;
  }
}
