import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/provider/provider.dart';

class GluestackStateN extends InheritedWidget {
  GluestackStateN({
    Key? key,
    required super.child,
    required this.test,
    this.radiiToken = const {
      "none": 2,
      "xs": 5,
      "sm": 0,
      "md": 20,
      "lg": 33,
      "xl": 44,
      "2xl": 55,
      "3xl": 66,
      "full": 999,
    },
  });

  Map<String, double> radiiToken;
  String test;

  static GluestackStateN? of(BuildContext context1) {
    final scope =
        context1.dependOnInheritedWidgetOfExactType<GluestackStateN>();
    return scope;
  }

  void updateRadiiToken(Map<String, double> newRadiiToken) {
    radiiToken = Map<String, double>.from(newRadiiToken);
  }

  void updateTestToken(String testNew) {
    test = testNew;

    log('DONE Changing test token to $testNew');
  }

  @override
  bool updateShouldNotify(GluestackStateN oldWidget) {
    log('In updateShouldNotify');
    log('Old: ${oldWidget.test} New: $test');
    return test != oldWidget.test;
  }
}
