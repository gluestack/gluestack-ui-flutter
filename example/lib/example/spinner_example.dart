import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';

class SpinnerExample extends StatelessWidget {
  const SpinnerExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
          GSSpinner(
              size: GSSpinnerSizes.large,
              style: GSStyle(
                  color: \$GSColors.amber400,
                  bg: \$GSColors.amber200,
              ),
              // strokeWidth: 10,
          ),
  ''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Spinner"),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSSpinner(
            size: GSSpinnerSizes.large,
            style: GSStyle(
              color: $GSColors.amber400,
              bg: $GSColors.amber200,
            ),
            // strokeWidth: 10,
          ),
        ),
      ),
    );
  }
}
