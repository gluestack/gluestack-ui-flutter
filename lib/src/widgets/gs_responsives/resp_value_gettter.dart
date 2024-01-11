import 'package:flutter/widgets.dart';

T? getRespValue<T>({
  required BuildContext buildContext,
  double? xsUpperBound = 450,
  double? smUpperBound = 576,
  double? mdUpperBound = 786,
  double? lgUpperBound = 992,
  double? xlUpperBound = 1200,
  double? xxlUpperBound = 1400,
  T? xsValue,
  T? smValue,
  T? mdValue,
  T? lgValue,
  T? xlValue,
  T? xxlValue,
}) {
  double screenWidth = MediaQuery.of(buildContext).size.width;

  if (xsUpperBound != null && screenWidth < xsUpperBound) {
    return xsValue ?? smValue ?? mdValue ?? lgValue ?? xlValue ?? xxlValue;
  } else if (smUpperBound != null && screenWidth < smUpperBound) {
    return smValue ?? mdValue ?? lgValue ?? xlValue ?? xxlValue ?? xsValue;
  } else if (mdUpperBound != null && screenWidth < mdUpperBound) {
    return mdValue ?? lgValue ?? xlValue ?? xxlValue ?? smValue ?? xsValue;
  } else if (lgUpperBound != null && screenWidth < lgUpperBound) {
    return lgValue ?? xlValue ?? xxlValue ?? mdValue ?? smValue ?? xsValue;
  } else if (xlUpperBound != null && screenWidth < xlUpperBound) {
  } else {
    return xxlValue ?? xlValue ?? lgValue ?? mdValue ?? smValue ?? xsValue;
  }

  return null;
}
