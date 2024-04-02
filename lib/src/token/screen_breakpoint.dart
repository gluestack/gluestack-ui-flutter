import 'package:gluestack_ui/src/provider/gluestack_provider.dart';



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
  static get base => getIt<GSScreenBreakpointToken>().base;
  static get small => getIt<GSScreenBreakpointToken>().sm;
  static get medium => getIt<GSScreenBreakpointToken>().md;
  static get large => getIt<GSScreenBreakpointToken>().lg;
  static get extraLarge => getIt<GSScreenBreakpointToken>().xxl;
  //TODO: Since there's no map nor is any resolver depending on this, need to confirm b4 proceeding
}
