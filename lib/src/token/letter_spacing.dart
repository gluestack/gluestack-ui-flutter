import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var letterSpacingInstance = getIt<GSLetterSpacingToken>();

class GSLetterSpacingToken {
  final double $xs;
  final double $sm;
  final double $md;
  final double $lg;
  final double $xl;
  final double $2xl;

  const GSLetterSpacingToken({
    this.$xs = -0.4,
    this.$sm = -0.2,
    this.$md = 0.0,
    this.$lg = 0.2,
    this.$xl = 0.4,
    this.$2xl = 1.6,
  });
}

class $GSLetterSpacing {
  static get $xs => letterSpacingInstance.$xs;
  static get $sm => letterSpacingInstance.$sm;
  static get $md => letterSpacingInstance.$md;
  static get $lg => letterSpacingInstance.$lg;
  static get $xl => letterSpacingInstance.$xl;
  static get $2xl => letterSpacingInstance.$2xl;

  static Map<String, double> letterSpacingMap = {
    "xs": $xs,
    "sm": $sm,
    "md": $md,
    "lg": $lg,
    "xl": $xl,
    "2xl": $2xl,
  };
}
