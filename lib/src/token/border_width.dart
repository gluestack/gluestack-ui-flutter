import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var bwtInstance = getIt<GSBorderWidthToken>();

class GSBorderWidthToken {
  final double $0;
  final double $1;
  final double $2;
  final double $4;
  final double $8;

  const GSBorderWidthToken({
    this.$0 = 0.0,
    this.$1 = 1.0,
    this.$2 = 2.0,
    this.$4 = 4.0,
    this.$8 = 8.0,
  });
}

class $GSBorderWidth {
  static get $0 => bwtInstance.$0;
  static get $1 => bwtInstance.$1;
  static get $2 => bwtInstance.$2;
  static get $4 => bwtInstance.$4;
  static get $8 => bwtInstance.$8;

  static Map<String, double> borderWidthMap = {
    "0": $0,
    "1": $1,
    "2": $2,
    "4": $4,
    "8": $8,
  };
}
