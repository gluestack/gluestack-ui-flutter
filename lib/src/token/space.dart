import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

class GSSpaceToken {
  final double px;
  final double $0;
  final double $0_5;
  final double $1;
  final double $1_5;
  final double $2;
  final double $2_5;
  final double $3;
  final double $3_5;
  final double $4;
  final double $4_5;
  final double $5;
  final double $6;
  final double $7;
  final double $8;
  final double $9;
  final double $10;
  final double $11;
  final double $12;
  final double $16;
  final double $20;
  final double $24;
  final double $32;
  final double $40;
  final double $48;
  final double $56;
  final double $64;
  final double $72;
  final double $80;
  final double $96;
  final double full;

  const GSSpaceToken({
    this.px = 1.0,
    this.$0 = 0.0,
    this.$0_5 = 2.0,
    this.$1 = 4.0,
    this.$1_5 = 6.0,
    this.$2 = 8.0,
    this.$2_5 = 10.0,
    this.$3 = 12.0,
    this.$3_5 = 14.0,
    this.$4 = 16.0,
    this.$4_5 = 18.0,
    this.$5 = 20.0,
    this.$6 = 24.0,
    this.$7 = 28.0,
    this.$8 = 32.0,
    this.$9 = 36.0,
    this.$10 = 40.0,
    this.$11 = 44.0,
    this.$12 = 48.0,
    this.$16 = 64.0,
    this.$20 = 80.0,
    this.$24 = 96.0,
    this.$32 = 128.0,
    this.$40 = 160.0,
    this.$48 = 192.0,
    this.$56 = 224.0,
    this.$64 = 256.0,
    this.$72 = 288.0,
    this.$80 = 320.0,
    this.$96 = 384.0,
    this.full = double.maxFinite,
  });
}

class $GSSpace {
  static get px => getIt<GSSpaceToken>().px;
  static get $0 => getIt<GSSpaceToken>().$0;
  static get $0_5 => getIt<GSSpaceToken>().$0_5;
  static get $1 => getIt<GSSpaceToken>().$1;
  static get $1_5 => getIt<GSSpaceToken>().$1_5;
  static get $2 => getIt<GSSpaceToken>().$2;
  static get $2_5 => getIt<GSSpaceToken>().$2_5;
  static get $3 => getIt<GSSpaceToken>().$3;
  static get $3_5 => getIt<GSSpaceToken>().$3_5;
  static get $4 => getIt<GSSpaceToken>().$4;
  static get $4_5 => getIt<GSSpaceToken>().$4_5;
  static get $5 => getIt<GSSpaceToken>().$5;
  static get $6 => getIt<GSSpaceToken>().$6;
  static get $7 => getIt<GSSpaceToken>().$7;
  static get $8 => getIt<GSSpaceToken>().$8;
  static get $9 => getIt<GSSpaceToken>().$9;
  static get $10 => getIt<GSSpaceToken>().$10;
  static get $11 => getIt<GSSpaceToken>().$11;
  static get $12 => getIt<GSSpaceToken>().$12;
  static get $16 => getIt<GSSpaceToken>().$16;
  static get $20 => getIt<GSSpaceToken>().$20;
  static get $24 => getIt<GSSpaceToken>().$24;
  static get $32 => getIt<GSSpaceToken>().$32;
  static get $40 => getIt<GSSpaceToken>().$40;
  static get $48 => getIt<GSSpaceToken>().$48;
  static get $56 => getIt<GSSpaceToken>().$56;
  static get $64 => getIt<GSSpaceToken>().$64;
  static get $72 => getIt<GSSpaceToken>().$72;
  static get $80 => getIt<GSSpaceToken>().$80;
  static get $96 => getIt<GSSpaceToken>().$96;
  static get full => getIt<GSSpaceToken>().full;

  late Map<String, double> spaceMap;

  $GSSpace() {
    spaceMap = {
      "px": px,
      "0": $0,
      "0.5": $0_5,
      "1": $1,
      "1.5": $1_5,
      "2": $2,
      "2.5": $2_5,
      "3": $3,
      "3.5": $3_5,
      "4": $4,
      "4.5": $4_5,
      "5": $5,
      "6": $6,
      "7": $7,
      "8": $8,
      "9": $9,
      "10": $10,
      "11": $11,
      "12": $12,
      "16": $16,
      "20": $20,
      "24": $24,
      "32": $32,
      "40": $40,
      "48": $48,
      "56": $56,
      "64": $64,
      "72": $72,
      "80": $80,
      "96": $96,
      "full": full,
    };
  }

  Map<String, double> getSpaceMap() {
    return spaceMap;
  }
}
