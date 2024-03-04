import 'package:flutter/widgets.dart';
// Breakpoint ref: https://getbootstrap.com/docs/5.0/layout/breakpoints/
// Breakpoint reference from Bootstrap documentation for responsive design considerations.

/// A widget that provides a responsive layout management system based on screen size.
/// It allows for different widgets to be displayed depending on the available width,
/// similar to responsive design frameworks like Bootstrap.
class GSRespLayoutManager extends StatelessWidget {
  /// Widgets to display for extra small screens, typically phones.
  final Widget? xsLayout;

  /// Widgets to display for small screens, typically larger phones or small tablets.
  final Widget? smLayout;

  /// Widgets to display for medium screens, like tablets.
  final Widget? mdLayout;

  /// Widgets to display for large screens, such as desktop monitors.
  final Widget? lgLayout;

  /// Widgets to display for extra-large screens, including large desktop monitors.
  final Widget? xlLayout;

  /// Widgets to display for extra extra-large screens, covering very large desktop displays.
  final Widget? xxlLayout;

  /// A fallback widget to display if no other widgets are applicable. This provides a default
  /// in case the screen size does not match any of the specified layouts.
  final Widget? fallBackWidget;

  /// Breakpoints defining the width thresholds for each screen size category.
  /// These default values are inspired by Bootstrap's responsive breakpoints.
  final double? xs;
  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;

  const GSRespLayoutManager({
    super.key,
    this.xsLayout,
    this.smLayout,
    this.mdLayout,
    this.lgLayout,
    this.xlLayout,
    this.xxlLayout,
    //upper bound
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
    // Set a default widget to be displayed if none of the layout widgets are provided.
    late final Widget defaultWidget;
    defaultWidget = fallBackWidget ??
        const Center(child: Text('Please specify atleast one widget!'));
    late final Widget? layoutWidget;
    // Determine which widget to display based on the current maximum width of the screen.
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double maxWidth = constraints.maxWidth;
      // Select the appropriate layout widget based on the maxWidth and provided breakpoints.
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
      // Return the selected layout widget or the default widget if none is applicable.
      return layoutWidget ?? defaultWidget;
    });
  }
}
