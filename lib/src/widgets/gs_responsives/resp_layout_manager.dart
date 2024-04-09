import 'package:gluestack_ui/gluestack_ui.dart';
// Breakpoint ref: https://getbootstrap.com/docs/5.0/layout/breakpoints/
// Breakpoint reference from Bootstrap documentation for responsive design considerations.

/// A widget that provides a responsive layout management system based on screen size.
/// It allows for different widgets to be displayed depending on the available width,
/// similar to responsive design frameworks like Bootstrap.
class GSResponsiveLayout extends StatelessWidget {
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

  const GSResponsiveLayout({
    super.key,
    this.xsLayout,
    this.smLayout,
    this.mdLayout,
    this.lgLayout,
    this.xlLayout,
  });

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to obtain screen width and select appropriate layout.

    final double screenWidth = MediaQuery.of(context).size.width;

    // Determine the widget to display based on the current screen width.
    Widget? layoutWidget;
    if (screenWidth < $GSScreenBreakpoint.small) {
      layoutWidget = xsLayout;
    } else if (screenWidth >= $GSScreenBreakpoint.small &&
        screenWidth < $GSScreenBreakpoint.medium) {
      layoutWidget = smLayout ?? xsLayout;
    } else if (screenWidth >= $GSScreenBreakpoint.medium &&
        screenWidth < $GSScreenBreakpoint.large) {
      layoutWidget = mdLayout ?? smLayout ?? xsLayout;
    } else if (screenWidth >= $GSScreenBreakpoint.large &&
        screenWidth < $GSScreenBreakpoint.extraLarge) {
      layoutWidget = lgLayout ?? mdLayout ?? smLayout ?? xsLayout;
    } else if (screenWidth >= $GSScreenBreakpoint.large) {
      layoutWidget = xlLayout ?? lgLayout ?? mdLayout ?? smLayout ?? xsLayout;
    }
    // Ensure a Widget is always returned.
    return layoutWidget ?? const SizedBox.shrink();
  }
}
