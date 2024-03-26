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


  /// Breakpoint values for screen widths, inspired by Bootstrap.
  final double xs, sm, md, lg, xl, xxl;

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
  });

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to obtain screen width and select appropriate layout.
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        // Determine the widget to display based on the current screen width.
        Widget? layoutWidget;
        if (maxWidth <= xs) {
          layoutWidget = xsLayout;
        } else if (maxWidth <= sm) {
          layoutWidget = smLayout ?? xsLayout;
        } else if (maxWidth <= md) {
          layoutWidget = mdLayout ?? smLayout ?? xsLayout;
        } else if (maxWidth <= lg) {
          layoutWidget = lgLayout ?? mdLayout ?? smLayout ?? xsLayout;
        } else if (maxWidth <= xl) {
          layoutWidget = xlLayout ?? lgLayout ?? mdLayout ?? smLayout ?? xsLayout;
        } else if (maxWidth <= xxl) {
          layoutWidget = xxlLayout ?? xlLayout ?? lgLayout ?? mdLayout ?? smLayout ?? xsLayout;
        } else {
          layoutWidget = xxlLayout ?? xlLayout ?? lgLayout ?? mdLayout ?? smLayout ?? xsLayout;
        }
        // Ensure a Widget is always returned.
        return layoutWidget ?? const SizedBox.shrink();
      },
    );
  }
}
