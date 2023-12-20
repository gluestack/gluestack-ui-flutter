import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CenterPreview extends StatelessWidget {
  const CenterPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Center',
        stories: [
          Story(
            name: 'Center',
            builder: (context) => GSCenter(
              style: GSStyle(
                height: 150,
                width: 300,
                bg: $GSColors.primary500,
              ),
              child: const GSCenter(
                child: GSText(
              text: 'This is the Center',
            )),
            ),
          ),
        ],
      ),
    );
  }
}
