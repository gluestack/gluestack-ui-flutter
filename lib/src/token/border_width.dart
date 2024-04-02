import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

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
  static get $0 => getIt<GSBorderWidthToken>().$0;
  static get $1 => getIt<GSBorderWidthToken>().$1;
  static get $2 => getIt<GSBorderWidthToken>().$2;
  static get $4 => getIt<GSBorderWidthToken>().$4;
  static get $8 => getIt<GSBorderWidthToken>().$8;

  late Map<String, double> borderWidthMap;

  $GSBorderWidth() {
    borderWidthMap = {
      "0": $0,
      "1": $1,
      "2": $2,
      "4": $4,
      "8": $8,
    };
  }

  Map<String, double> getBorderWidthMap() {
    return borderWidthMap;
  }
}
