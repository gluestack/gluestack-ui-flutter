import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class Trial extends StatelessWidget {
  const Trial({super.key});

  @override
  Widget build(BuildContext context) {
    bool findAncestor(BuildContext context) {
      final widget = context.findAncestorWidgetOfExactType<Column>();
      if (widget is Column) {
        return true;
      }
      return false;
    }

    print("Ancestory found: ${findAncestor(context)}");
    return Text("HiHi");
  }
}
