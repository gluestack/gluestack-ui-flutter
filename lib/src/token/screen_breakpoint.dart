import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var screenBreakpointInstance = getIt<GSScreenBreakpointToken>();

class GSScreenBreakpointToken {
  final double base;
  final double sm; //small
  final double md; //medium
  final double lg; //large
  final double xxl; //extraLarge

  const GSScreenBreakpointToken({
    this.base = 0,
    this.sm = 480,
    this.md = 786,
    this.lg = 992,
    this.xxl = 1280,
  });
}

class $GSScreenBreakpoint {
  static get base => screenBreakpointInstance.base;
  static get small => screenBreakpointInstance.sm;
  static get medium => screenBreakpointInstance.md;
  static get large => screenBreakpointInstance.lg;
  static get extraLarge => screenBreakpointInstance.xxl;
}
