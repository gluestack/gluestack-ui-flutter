import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BoxPreview extends StatelessWidget {
  const BoxPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Box',
        stories: [
          Story(
            name: 'Box',
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
      ),
    );
  }
}
