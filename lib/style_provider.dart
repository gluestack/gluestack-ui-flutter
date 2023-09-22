import 'package:flutter/material.dart';

// class StyleProvider extends InheritedWidget {
//   final ButtonStyle style;

//   StyleProvider({required this.style, required Widget child})
//       : super(child: child);

//   static StyleProvider? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<StyleProvider>();
//   }

//   @override
//   bool updateShouldNotify(StyleProvider oldWidget) {
//     return style != oldWidget.style;
//   }
// }

class StyleAttributes {
  final Map<String, dynamic> attributes;
  StyleAttributes(this.attributes);

  // Define a method to get the attribute by key
  dynamic getAttribute(String key) {
    return attributes[key];
  }
}

class StyleProvider extends InheritedWidget {
  final StyleAttributes style;
  StyleProvider({required this.style, required Widget child})
      : super(child: child);

  static StyleProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StyleProvider>();
  }

  @override
  bool updateShouldNotify(StyleProvider oldWidget) {
    return style != oldWidget.style;
  }
}
