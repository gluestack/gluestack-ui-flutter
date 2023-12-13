import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

var fontSizeInstance = getIt<GSFontSizeToken>();

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
  static get $2xs => fontSizeInstance.$2xs;
  static get $xs => fontSizeInstance.$xs;
  static get $sm => fontSizeInstance.$sm;
  static get $md => fontSizeInstance.$md;
  static get $lg => fontSizeInstance.$lg;
  static get $xl => fontSizeInstance.$xl;
  static get $2xl => fontSizeInstance.$2xl;
  static get $3xl => fontSizeInstance.$3xl;
  static get $4xl => fontSizeInstance.$4xl;
  static get $5xl => fontSizeInstance.$5xl;
  static get $6xl => fontSizeInstance.$6xl;
  static get $7xl => fontSizeInstance.$7xl;
  static get $8xl => fontSizeInstance.$8xl;
  static get $9xl => fontSizeInstance.$9xl;

  static Map<String, double> fontMap = {
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
