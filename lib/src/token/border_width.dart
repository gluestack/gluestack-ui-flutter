import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var bwInstance = getIt<$GSBorderWidth>();
class $GSBorderWidth {
  final double $0og;
  final double $1og;
  final double $2og;
  final double $4og;
  final double $8og;

  const $GSBorderWidth({
    this.$0og = 0.0,
    this.$1og = 1.0,
    this.$2og = 2.0,
    this.$4og = 4.0,
    this.$8og = 8.0,
  });

  static get $0 => bwInstance.$0og;
  static get $1 => bwInstance.$1og;
  static get $2 => bwInstance.$2og;
  static get $4 => bwInstance.$4og;
  static get $8 => bwInstance.$8og;

  static Map<String, double> borderWidthMap = {
    "0": $0,
    "1": $1,
    "2": $2,
    "4": $4,
    "8": $8,
  };
}
