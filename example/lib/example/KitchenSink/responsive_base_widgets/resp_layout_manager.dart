import 'package:flutter/material.dart';

class RespLayoutManager extends StatelessWidget {
  // breakpoint ref: https://getbootstrap.com/docs/5.0/layout/breakpoints/
  final Widget? xsLayout;

  final Widget? smLayout;
  final Widget? mdLayout;
  final Widget? lgLayout;
  final Widget? xlLayout;
  final Widget? xxlLayout;
  final Widget? fallBackWidget;

  final double? xs;

  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;

  const RespLayoutManager({
    super.key,
    this.xsLayout,
    this.smLayout,
    this.mdLayout,
    this.lgLayout,
    this.xlLayout,
    this.xxlLayout,
    //min bound
    this.xs = 450,
    this.sm = 576,
    this.md = 768,
    this.lg = 992,
    this.xl = 1200,
    this.xxl = 1400,
    this.fallBackWidget,
  });

  @override
  Widget build(BuildContext context) {
    late final Widget defaultWidget;
    defaultWidget = fallBackWidget ??
        const Center(child: Text('Please specify atleast one widget!'));
    late final Widget? layoutWidget;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double maxWidth = constraints.maxWidth;

      if (maxWidth <= xs!) {
        layoutWidget = xsLayout ??
            smLayout ??
            mdLayout ??
            lgLayout ??
            xlLayout ??
            xxlLayout;
      } else if (maxWidth <= sm!) {
        layoutWidget = smLayout ??
            mdLayout ??
            lgLayout ??
            xlLayout ??
            xxlLayout ??
            xsLayout;
      } else if (maxWidth <= md!) {
        layoutWidget = mdLayout ??
            lgLayout ??
            xlLayout ??
            xxlLayout ??
            smLayout ??
            xsLayout;
      } else if (maxWidth <= lg!) {
        layoutWidget = lgLayout ??
            xlLayout ??
            xxlLayout ??
            mdLayout ??
            smLayout ??
            xsLayout;
      } else if (maxWidth <= xl!) {
        layoutWidget = xlLayout ??
            xxlLayout ??
            mdLayout ??
            lgLayout ??
            smLayout ??
            xsLayout;
      } else if (maxWidth <= xxl!) {
        layoutWidget = xxlLayout ??
            xlLayout ??
            mdLayout ??
            lgLayout ??
            smLayout ??
            xsLayout;
      } else {
        layoutWidget = xxlLayout ??
            xlLayout ??
            mdLayout ??
            lgLayout ??
            smLayout ??
            xsLayout ??
            defaultWidget;
      }
      return layoutWidget ?? defaultWidget;
    });
  }
}
