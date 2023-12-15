import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TextPreview extends StatelessWidget {
  const TextPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Text',
      stories: [
        Story(
          name: 'Text',
          builder: (context) => GSText(
            text: 'test 1',
            bold: true,
            underline: true,
            style: GSStyle(
              textStyle: TextStyle(letterSpacing: $GSLetterSpacing.$lg),
            ),
          ),
        ),
      ],
    );
  }
}
