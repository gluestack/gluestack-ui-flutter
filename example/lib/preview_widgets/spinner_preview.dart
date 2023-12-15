import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SpinnerPreview extends StatelessWidget {
  const SpinnerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Spinner',
      stories: [
        Story(
          name: 'Spinner',
          description:
              'Spinners are designed to give visual cues to users that an action is being processed or that a change or result is expected. They are useful for improving the user experience by reducing frustration and uncertainty..',
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
    );
  }
}
