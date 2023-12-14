import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var radiiInstance = getIt<GSRadiiToken>();

class GSRadiiToken {
  final double none;
  final double $xs;
  final double $sm;
  final double $md;
  final double $lg;
  final double $xl;
  final double $2xl;
  final double $3xl;
  final double full;

  const GSRadiiToken({
    this.none = 0.0,
    this.$xs = 2.0,
    this.$sm = 4.0,
    this.$md = 6.0,
    this.$lg = 8.0,
    this.$xl = 12.0,
    this.$2xl = 16.0,
    this.$3xl = 24.0,
    this.full = 9999.0,
  });
}

class $GSRadii {
  static get none => radiiInstance.none;
  static get $xs => radiiInstance.$xs;
  static get $sm => radiiInstance.$sm;
  static get $md => radiiInstance.$md;
  static get $lg => radiiInstance.$lg;
  static get $xl => radiiInstance.$xl;
  static get $2xl => radiiInstance.$2xl;
  static get $3xl => radiiInstance.$3xl;
  static get full => radiiInstance.full;

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
