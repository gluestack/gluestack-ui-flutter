import 'package:flutter/widgets.dart';

/// A utility function to determine a value based on the current screen width.
/// This allows for responsive design values that adjust to the screen size, providing
/// different values for specified breakpoints.
/// The function returns a value of type [T], which can be any type needed for the responsive design,
/// such as [double], [int], [String], or even complex objects.
T? getRespValue<T>({
  required BuildContext context,
  double? xsBreakpoint = 450, // Extra small devices upper bound
  double? smBreakpoint = 576, // Small devices upper bound
  double? mdBreakpoint = 786, // Medium devices upper bound
  double? lgBreakpoint = 992, // Large devices upper bound
  double? xlBreakpoint = 1200, // Extra large devices upper bound
  double? xxlBreakpoint = 1400, // Extra extra large devices upper bound
  T? xsValue, // Value for extra small devices
  T? smValue, // Value for small devices
  T? mdValue, // Value for medium devices
  T? lgValue, // Value for large devices
  T? xlValue, // Value for extra large devices
  T? xxlValue, // Value for extra extra large devices
}) {
  final double screenWidth =
      MediaQuery.of(context).size.width; // Retrieves current screen width

  // Determine and return the appropriate value based on the screen width and the specified upper bounds.
  if (screenWidth < smBreakpoint!) {
    return xsValue;
  } else if (screenWidth >= smBreakpoint && screenWidth < mdBreakpoint!) {
    return smValue ?? xsValue;
  } else if (screenWidth >= mdBreakpoint! && screenWidth < lgBreakpoint!) {
    return mdValue ?? smValue ?? xsValue;
  } else if (screenWidth >= lgBreakpoint! && screenWidth < xlBreakpoint!) {
    return lgValue ?? mdValue ?? smValue ?? xsValue;
  } else if (screenWidth >= xlBreakpoint! && screenWidth < xxlBreakpoint!) {
    return xlValue ?? lgValue ?? mdValue ?? smValue ?? xsValue;
  } else if (screenWidth >= xxlBreakpoint!) {
    return xxlValue ?? xlValue ?? lgValue ?? mdValue ?? smValue ?? xsValue;
  }

  // Return null if no matching condition is found, which allows for default handling.
  return null;
}
