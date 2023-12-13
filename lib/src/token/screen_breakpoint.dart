import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var screenBreakpointInstance = getIt<GSScreenBreakpointToken>();

class GSScreenBreakpointToken {
  final double base;
  final double small; //sm
  final double medium; //md
  final double large; //lg
  final double extraLarge; //xxl

  const GSScreenBreakpointToken({
    this.base = 0,
    this.small = 480,
    this.medium = 786,
    this.large = 992,
    this.extraLarge = 1280,
  });
}

class $GSScreenBreakpoint {
  static get base => screenBreakpointInstance.base;
  static get small => screenBreakpointInstance.small;
  static get medium => screenBreakpointInstance.medium;
  static get large => screenBreakpointInstance.large;
  static get extraLarge => screenBreakpointInstance.extraLarge;

}
