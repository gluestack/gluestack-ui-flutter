import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SpinnerPreview extends StatelessWidget {
  const SpinnerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Spinner',
        stories: [
          Story(
            name: 'Spinner',
            builder: (context) => GSSpinner(
              strokeWidth: 4,
              style: GSStyle(
                bg: $GSColors.blueGray300,
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
