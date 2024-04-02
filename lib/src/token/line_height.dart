import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

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
  static get $2xs => getIt<GSLineHeightToken>().$2xs;
  static get $xs => getIt<GSLineHeightToken>().$xs;
  static get $sm => getIt<GSLineHeightToken>().$sm;
  static get $md => getIt<GSLineHeightToken>().$md;
  static get $lg => getIt<GSLineHeightToken>().$lg;
  static get $xl => getIt<GSLineHeightToken>().$xl;
  static get $2xl => getIt<GSLineHeightToken>().$2xl;
  static get $3xl => getIt<GSLineHeightToken>().$3xl;
  static get $4xl => getIt<GSLineHeightToken>().$4xl;
  static get $5xl => getIt<GSLineHeightToken>().$5xl;
  static get $6xl => getIt<GSLineHeightToken>().$6xl;
  static get $7xl => getIt<GSLineHeightToken>().$7xl;

  late Map<String, double> lineHeightMap;

  $GSLineHeight() {
    lineHeightMap = {
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

  Map<String, double> getLineHeightMap() {
    return lineHeightMap;
  }
}
