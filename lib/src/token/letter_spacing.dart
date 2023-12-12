import 'package:gluestack_ui/gluestack_provider.dart';

var letterSpacingInstance = getIt<$GSLetterSpacing>();

class $GSLetterSpacing {
  final double $xsog;
  final double $smog;
  final double $mdog;
  final double $lgog;
  final double $xlog;
  final double $2xlog;

  const $GSLetterSpacing({
    this.$xsog = -0.4,
    this.$smog = -0.2,
    this.$mdog = 0.0,
    this.$lgog = 0.2,
    this.$xlog = 0.4,
    this.$2xlog = 1.6,
  });

  static get $xs => letterSpacingInstance.$xsog;
  static get $sm => letterSpacingInstance.$smog;
  static get $md => letterSpacingInstance.$mdog;
  static get $lg => letterSpacingInstance.$lgog;
  static get $xl => letterSpacingInstance.$xlog;
  static get $2xl => letterSpacingInstance.$2xlog;

  static Map<String, double> letterSpacingMap = {
    "xs": $xs,
    "sm": $sm,
    "md": $md,
    "lg": $lg,
    "xl": $xl,
    "2xl": $2xl,
  };
}