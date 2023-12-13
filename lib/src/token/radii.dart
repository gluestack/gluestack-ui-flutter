import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var radiiInstance = getIt<$GSRadii>();
class $GSRadii {
  final double noneog;
  final double $xsog;
  final double $smog;
  final double $mdog;
  final double $lgog;
  final double $xlog;
  final double $2xlog;
  final double $3xlog;
  final double fullog;

  const $GSRadii({
    this.noneog = 0.0,
    this.$xsog = 2.0,
    this.$smog = 4.0,
    this.$mdog = 6.0,
    this.$lgog = 8.0,
    this.$xlog = 12.0,
    this.$2xlog = 16.0,
    this.$3xlog = 24.0,
    this.fullog = 9999.0,
  });

  static get none => radiiInstance.noneog;
  static get $xs => radiiInstance.$xsog;
  static get $sm => radiiInstance.$smog;
  static get $md => radiiInstance.$mdog;
  static get $lg => radiiInstance.$lgog;
  static get $xl => radiiInstance.$xlog;
  static get $2xl => radiiInstance.$2xlog;
  static get $3xl => radiiInstance.$3xlog;
  static get full => radiiInstance.fullog;

  static Map<String, double> radiiMap = {
    "none": none,
    "xs": $xs,
    "sm": $sm,
    "md": $md,
    "lg": $lg,
    "xl": $xl,
    "2xl": $2xl,
    "3xl": $3xl,
    "full": full,
  };
}