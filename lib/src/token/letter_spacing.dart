import 'package:gluestack_ui/src/provider/gluestack_provider.dart';



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
  static get $xs =>  getIt<GSLetterSpacingToken>().$xs;
  static get $sm =>  getIt<GSLetterSpacingToken>().$sm;
  static get $md =>  getIt<GSLetterSpacingToken>().$md;
  static get $lg =>  getIt<GSLetterSpacingToken>().$lg;
  static get $xl =>  getIt<GSLetterSpacingToken>().$xl;
  static get $2xl =>  getIt<GSLetterSpacingToken>().$2xl;

 late  Map<String, double> letterSpacingMap;
 $GSLetterSpacing(){
  letterSpacingMap = {
    "xs": $xs,
    "sm": $sm,
    "md": $md,
    "lg": $lg,
    "xl": $xl,
    "2xl": $2xl,
  };
 }

   Map<String, double> getLetterSpacingMap (){
    return letterSpacingMap;
   }
}
