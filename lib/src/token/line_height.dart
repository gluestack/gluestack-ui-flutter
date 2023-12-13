import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var lineHeightInstance = getIt<$GSLineHeight>();
class $GSLineHeight {
  final double $2xsog;
  final double $xsog;
  final double $smog;
  final double $mdog;
  final double $lgog;
  final double $xlog;
  final double $2xlog;
  final double $3xlog;
  final double $4xlog;
  final double $5xlog;
  final double $6xlog;
  final double $7xlog;

  const $GSLineHeight({
    this.$2xsog = 16.0,
    this.$xsog = 18.0,
    this.$smog = 20.0,
    this.$mdog = 22.0,
    this.$lgog = 24.0,
    this.$xlog = 28.0,
    this.$2xlog = 32.0,
    this.$3xlog = 40.0,
    this.$4xlog = 48.0,
    this.$5xlog = 56.0,
    this.$6xlog = 72.0,
    this.$7xlog = 90.0,
  });

  static get $2xs => lineHeightInstance.$2xsog;
  static get $xs => lineHeightInstance.$xsog;
  static get $sm => lineHeightInstance.$smog;
  static get $md => lineHeightInstance.$mdog;
  static get $lg => lineHeightInstance.$lgog;
  static get $xl => lineHeightInstance.$xlog;
  static get $2xl => lineHeightInstance.$2xlog;
  static get $3xl => lineHeightInstance.$3xlog;
  static get $4xl => lineHeightInstance.$4xlog;
  static get $5xl => lineHeightInstance.$5xlog;
  static get $6xl => lineHeightInstance.$6xlog;
  static get $7xl => lineHeightInstance.$7xlog;

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