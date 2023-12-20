import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class DividerPreview extends StatelessWidget {
  const DividerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Divider',
        stories: [
          Story(
            name: 'Divider',
            builder: (context) => GSHStack(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
              GSBox(
                style: GSStyle(
                  padding: const EdgeInsets.all(8.0),
                ),
                child: const GSText(
                  text: "Easy",
                ),
              ),
              GSDivider(
                orientation: GSOrientations.vertical,
                style: GSStyle(height: 30),
              ),
              GSBox(
                style: GSStyle(
                  padding: const EdgeInsets.all(8.0),
                ),
                child: const GSText(
                  text: "Difficult",
                ),
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }
}
