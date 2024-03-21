import 'package:flutter/widgets.dart';

/// A utility function to determine a value based on the current screen width.
/// This allows for responsive design values that adjust to the screen size, providing
/// different values for specified breakpoints.
/// The function returns a value of type [T], which can be any type needed for the responsive design,
/// such as [double], [int], [String], or even complex objects.
T? getRespValue<T>({
  required BuildContext buildContext,
  double? xsUpperBound = 450, // Extra small devices upper bound
  double? smUpperBound = 576, // Small devices upper bound
  double? mdUpperBound = 786, // Medium devices upper bound
  double? lgUpperBound = 992, // Large devices upper bound
  double? xlUpperBound = 1200, // Extra large devices upper bound
  double? xxlUpperBound = 1400, // Extra extra large devices upper bound
  T? xsValue, // Value for extra small devices
  T? smValue, // Value for small devices
  T? mdValue, // Value for medium devices
  T? lgValue, // Value for large devices
  T? xlValue, // Value for extra large devices
  T? xxlValue, // Value for extra extra large devices
}) {
  double screenWidth =
      MediaQuery.of(buildContext).size.width; // Obtain the current screen width

  // Determine and return the appropriate value based on the screen width and the specified upper bounds.
  if (xsUpperBound != null && screenWidth < xsUpperBound) {
    return xsValue ?? smValue ?? mdValue ?? lgValue ?? xlValue ?? xxlValue;
  } else if (smUpperBound != null && screenWidth < smUpperBound) {
    return smValue ?? mdValue ?? lgValue ?? xlValue ?? xxlValue ?? xsValue;
  } else if (mdUpperBound != null && screenWidth < mdUpperBound) {
    return mdValue ?? lgValue ?? xlValue ?? xxlValue ?? smValue ?? xsValue;
  } else if (lgUpperBound != null && screenWidth < lgUpperBound) {
    return lgValue ?? xlValue ?? xxlValue ?? mdValue ?? smValue ?? xsValue;
  } else if (xlUpperBound != null && screenWidth < xlUpperBound) {
    return xlValue ?? xxlValue ?? lgValue ?? mdValue ?? smValue ?? xsValue;
  } else if (xxlUpperBound != null && screenWidth >= xxlUpperBound) {
    return xxlValue ?? xlValue ?? lgValue ?? mdValue ?? smValue ?? xsValue;
  }

  // Return null if no matching condition is found, which allows for default handling.
  return null;
}
