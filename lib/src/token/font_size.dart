import 'package:gluestack_ui/gluestack_provider.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

var fontSizeInstance = getIt<$GSFontSize>();

class $GSFontSize {
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
  final double $8xlog;
  final double $9xlog;

  const $GSFontSize({
    this.$2xsog = 10.0,
    this.$xsog = 12.0,
    this.$smog = 14.0,
    this.$mdog = 16.0,
    this.$lgog = 18.0,
    this.$xlog = 20.0,
    this.$2xlog = 24.0,
    this.$3xlog = 30.0,
    this.$4xlog = 36.0,
    this.$5xlog = 48.0,
    this.$6xlog = 60.0,
    this.$7xlog = 72.0,
    this.$8xlog = 96.0,
    this.$9xlog = 128.0,
  });

  static get $2xs => fontSizeInstance.$2xsog;
  static get $xs => fontSizeInstance.$xsog;
  static get $sm => fontSizeInstance.$smog;
  static get $md => fontSizeInstance.$mdog;
  static get $lg => fontSizeInstance.$lgog;
  static get $xl => fontSizeInstance.$xlog;
  static get $2xl => fontSizeInstance.$2xlog;
  static get $3xl => fontSizeInstance.$3xlog;
  static get $4xl => fontSizeInstance.$4xlog;
  static get $5xl => fontSizeInstance.$5xlog;
  static get $6xl => fontSizeInstance.$6xlog;
  static get $7xl => fontSizeInstance.$7xlog;
  static get $8xl => fontSizeInstance.$8xlog;
  static get $9xl => fontSizeInstance.$9xlog;

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
