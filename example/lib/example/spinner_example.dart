import 'package:flutter/material.dart' hide Center;
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';

class SpinnerExample extends StatelessWidget {
  const SpinnerExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''GSSpinner(
            strokeWidth: 6,
            style: GSStyle(
                color: \$GSColors.rose500,
                bg: \$GSColors.blueGray300,
                width: 40,
                height: 40),
          )
  ''';
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BaseLayout(
          code: code,
          component: Spinner(
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
