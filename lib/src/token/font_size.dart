import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class GSFontSizeToken {
  final double $2xs;
  final double $xs;
  final double $sm;
  final double $md;
  final double $lg;
  final double $xl;
  final double $2xl;
  final double $3xl;
  final double $4xl;
  final double $5xl;
  final double $6xl;
  final double $7xl;
  final double $8xl;
  final double $9xl;

  const GSFontSizeToken({
    this.$2xs = 10.0,
    this.$xs = 12.0,
    this.$sm = 14.0,
    this.$md = 16.0,
    this.$lg = 18.0,
    this.$xl = 20.0,
    this.$2xl = 24.0,
    this.$3xl = 30.0,
    this.$4xl = 36.0,
    this.$5xl = 48.0,
    this.$6xl = 60.0,
    this.$7xl = 72.0,
    this.$8xl = 96.0,
    this.$9xl = 128.0,
  });
}

class $GSFontSize {
  static get $2xs => getIt<GSFontSizeToken>().$2xs;
  static get $xs => getIt<GSFontSizeToken>().$xs;
  static get $sm => getIt<GSFontSizeToken>().$sm;
  static get $md => getIt<GSFontSizeToken>().$md;
  static get $lg => getIt<GSFontSizeToken>().$lg;
  static get $xl => getIt<GSFontSizeToken>().$xl;
  static get $2xl => getIt<GSFontSizeToken>().$2xl;
  static get $3xl => getIt<GSFontSizeToken>().$3xl;
  static get $4xl => getIt<GSFontSizeToken>().$4xl;
  static get $5xl => getIt<GSFontSizeToken>().$5xl;
  static get $6xl => getIt<GSFontSizeToken>().$6xl;
  static get $7xl => getIt<GSFontSizeToken>().$7xl;
  static get $8xl => getIt<GSFontSizeToken>().$8xl;
  static get $9xl => getIt<GSFontSizeToken>().$9xl;

  late Map<String, double> fontMap;

  $GSFontSize() {
    fontMap = {
      '2xs': $2xs,
      'xs': $xs,
      'sm': $sm,
      'md': $md,
      'lg': $lg,
      'xl': $xl,
      '2xl': $2xl,
      '3xl': $3xl,
      '4xl': $4xl,
      '5xl': $5xl,
      '6xl': $6xl,
      '7xl': $7xl,
      '8xl': $8xl,
      '9xl': $9xl,
    };
  }

  Map<String, double> getFontSizeMap() {
    return fontMap;
  }
}
