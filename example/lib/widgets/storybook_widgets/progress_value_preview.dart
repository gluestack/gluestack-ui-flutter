import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ProgressValuePreview extends StatelessWidget {
  const ProgressValuePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Progress',
        initialLayout: Layout.compact,
        stories: [
          Story(
            name: 'Progress',
            builder: (context) => GSBox(
              style: GSStyle(width: 300, height: 100),
              child: const GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSText(text: "Downloading 55%"),
                  SizedBox(
                    height: 5,
                  ),
                  GSProgress(
                    value: 0.55,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
