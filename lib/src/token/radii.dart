import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

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
  static get none => getIt<GSRadiiToken>().none;
  static get $xs => getIt<GSRadiiToken>().$xs;
  static get $sm => getIt<GSRadiiToken>().$sm;
  static get $md => getIt<GSRadiiToken>().$md;
  static get $lg => getIt<GSRadiiToken>().$lg;
  static get $xl => getIt<GSRadiiToken>().$xl;
  static get $2xl => getIt<GSRadiiToken>().$2xl;
  static get $3xl => getIt<GSRadiiToken>().$3xl;
  static get full => getIt<GSRadiiToken>().full;

  late Map<String, double> radiiMap;

  $GSRadii() {
    radiiMap = {
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

  Map<String, double> getRadiiMap() {
    return radiiMap;
  }
}
