import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SpinnerWithLabelPreview extends StatelessWidget {
  const SpinnerWithLabelPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Spinner',
        stories: [
          Story(
            name: 'Spinner',
            builder: (context) => GSBox(
              style: GSStyle(width: 300, height: 100),
              child: GSHStack(
                children: [
                  GSSpinner(
                    strokeWidth: 2,
                    style: GSStyle(
                      bg: $GSColors.blueGray300,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const GSText(text: "Please wait...")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
