import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class DividerPreview extends StatelessWidget {
  const DividerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Divider',
      stories: [
        Story(
          name: 'Divider',
          description:
              'Use it to visually separate different sections of a list or group for a more structured and easy-to-read interface.',
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Easy"),
              ),
              GSDivider(
                orientation: GSOrientations.vertical,
                style: GSStyle(height: 30),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Difficult"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}