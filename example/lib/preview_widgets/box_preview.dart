import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BoxPreview extends StatelessWidget {
  const BoxPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Box',
      stories: [
        Story(
          name: 'Box',
          description:
              'If you are looking for a flexible component to help with low-level layout needs, the Box component might be just what you need.',
          builder: (context) => GSBox(
            style: GSStyle(
              padding: EdgeInsets.all($GSSpace.$5),
              bg: $GSColors.primary500,
            ),
            child: const GSText(
              text: 'This is the Box',
            ),
          ),
        ),
      ],
    );
  }
}
