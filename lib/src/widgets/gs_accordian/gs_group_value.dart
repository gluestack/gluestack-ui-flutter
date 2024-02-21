import 'package:flutter/widgets.dart';

class AccordionExpansionValue extends ChangeNotifier {
  // static final AccordionExpansionValue _instance = AccordionExpansionValue._instance;
  // factory AccordionExpansionValue() {
  //   return _instance;
  // }
  final ValueNotifier<List<bool>> accGroupValues =
      ValueNotifier<List<bool>>(List.empty(growable: true));

  void resetAccordionGroupValue() {
    for (int i = 0; i < accGroupValues.value.length; i++) {
      accGroupValues.value[i] = false;
    }
    // print('resetted value: ${accGroupValues.value}');
    notifyListeners();
  }

  void init(int length) {
    for (int i = 0; i < length; i++) {
      accGroupValues.value.add(false);
    }
    // print('---- init: ----');
    // print(accGroupValues.toString());
    notifyListeners();
  }

  void toggleAccordionGroupValue(int index) {
    // print('---- toggle value: ----');
    // print('og array: ${accGroupValues.value}');
    accGroupValues.value[index] = !accGroupValues.value[index];

    final og = [...accGroupValues.value];
    accGroupValues.value = og;
    // print('val og: $og | mod: ${accGroupValues.value[index]}');

    notifyListeners();
  }

  bool getAccordionExpansionValue(int index) {
    if (index > accGroupValues.value.length - 1) {
      return false;
    }
    return accGroupValues.value[index];
  }

  String getAllValues() {
    return accGroupValues.toString();
  }
}
