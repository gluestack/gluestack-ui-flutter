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
  final double xsBreakpoint,
      smBreakpoint,
      mdBreakpoint,
      lgBreakpoint,
      xlBreakpoint,
      xxlBreakpoint;

  const GSRespLayoutManager({
    super.key,
    this.xsLayout,
    this.smLayout,
    this.mdLayout,
    this.lgLayout,
    this.xlLayout,
    this.xxlLayout,
    //upper bound
    this.xsBreakpoint = 450,
    this.smBreakpoint = 576,
    this.mdBreakpoint = 768,
    this.lgBreakpoint = 992,
    this.xlBreakpoint = 1200,
    this.xxlBreakpoint = 1400,
  });

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to obtain screen width and select appropriate layout.
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double screenWidth = constraints.maxWidth;
        // Determine the widget to display based on the current screen width.
        Widget? layoutWidget;
        if (screenWidth < smBreakpoint) {
          layoutWidget = xsLayout;
        } else if (screenWidth >= smBreakpoint && screenWidth < mdBreakpoint) {
          layoutWidget = smLayout ?? xsLayout;
        } else if (screenWidth >= mdBreakpoint && screenWidth < lgBreakpoint) {
          layoutWidget = mdLayout ?? smLayout ?? xsLayout;
        } else if (screenWidth >= lgBreakpoint && screenWidth < xlBreakpoint) {
          layoutWidget = lgLayout ?? mdLayout ?? smLayout ?? xsLayout;
        } else if (screenWidth >= xlBreakpoint && screenWidth < xxlBreakpoint) {
          layoutWidget =
              xlLayout ?? lgLayout ?? mdLayout ?? smLayout ?? xsLayout;
        } else if (screenWidth >= xxlBreakpoint) {
          layoutWidget = xxlLayout ??
              xlLayout ??
              lgLayout ??
              mdLayout ??
              smLayout ??
              xsLayout;
        }
        // Ensure a Widget is always returned.
        return layoutWidget ?? const SizedBox.shrink();
      },
    );
  }
}
