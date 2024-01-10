import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';

class SpinnerExample extends StatelessWidget {
  const SpinnerExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSSpinner(
              strokeWidth: 6,
              style: GSStyle(
                  color: \$GSColors.rose500,
                  bg: \$GSColors.blueGray300,
                  width: 40,
                  height: 40
                  ),
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spinner"),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSSpinner(
            strokeWidth: 6,
            style: GSStyle(
                color: $GSColors.rose500,
                bg: $GSColors.blueGray300,
                width: 40,
                height: 40),
          ),
        ),
      ),
    );
  }
}
