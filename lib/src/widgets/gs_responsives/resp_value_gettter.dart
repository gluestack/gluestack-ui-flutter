import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/token/screen_breakpoint.dart';

/// A utility function to determine a value based on the current screen width.
/// This allows for responsive design values that adjust to the screen size, providing
/// different values for specified breakpoints.
/// The function returns a value of type [T], which can be any type needed for the responsive design,
/// such as [double], [int], [String], or even complex objects.
T? getResponsiveValue<T>({
  required BuildContext context,
  T? xsValue, // Value for extra small devices
  T? smValue, // Value for small devices
  T? mdValue, // Value for medium devices
  T? lgValue, // Value for large devices
  T? xlValue, // Value for extra large devices
}) {
  final double screenWidth =
      MediaQuery.of(context).size.width; // Retrieves current screen width

  // Determine and return the appropriate value based on the screen width and the specified upper bounds.
  if (screenWidth < $GSScreenBreakpoint.small) {
    return xsValue;
  } else if (screenWidth >= $GSScreenBreakpoint.small &&
      screenWidth < $GSScreenBreakpoint.medium) {
    return smValue ?? xsValue;
  } else if (screenWidth >= $GSScreenBreakpoint.medium &&
      screenWidth < $GSScreenBreakpoint.large) {
    return mdValue ?? smValue ?? xsValue;
  } else if (screenWidth >= $GSScreenBreakpoint.large &&
      screenWidth < $GSScreenBreakpoint.extraLarge) {
    return lgValue ?? mdValue ?? smValue ?? xsValue;
  } else if (screenWidth >= $GSScreenBreakpoint.extraLarge) {
    return xlValue ?? lgValue ?? mdValue ?? smValue ?? xsValue;
  } else {
    // Return null if no matching condition is found, which allows for default handling.
    return null;
  }
}
