import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var lineHeightInstance = getIt<GSLineHeightToken>();

class GSLineHeightToken {
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

  const GSLineHeightToken({
    this.$2xs = 16.0,
    this.$xs = 18.0,
    this.$sm = 20.0,
    this.$md = 22.0,
    this.$lg = 24.0,
    this.$xl = 28.0,
    this.$2xl = 32.0,
    this.$3xl = 40.0,
    this.$4xl = 48.0,
    this.$5xl = 56.0,
    this.$6xl = 72.0,
    this.$7xl = 90.0,
  });
}

class $GSLineHeight {
  static get $2xs => lineHeightInstance.$2xs;
  static get $xs => lineHeightInstance.$xs;
  static get $sm => lineHeightInstance.$sm;
  static get $md => lineHeightInstance.$md;
  static get $lg => lineHeightInstance.$lg;
  static get $xl => lineHeightInstance.$xl;
  static get $2xl => lineHeightInstance.$2xl;
  static get $3xl => lineHeightInstance.$3xl;
  static get $4xl => lineHeightInstance.$4xl;
  static get $5xl => lineHeightInstance.$5xl;
  static get $6xl => lineHeightInstance.$6xl;
  static get $7xl => lineHeightInstance.$7xl;

  static Map<String, double> lineHeightMap = {
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
  };
}
