import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class VStackReversedPreview extends StatelessWidget {
  const VStackReversedPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'VStack',
        stories: [
          Story(
            name: 'VStack',
            builder: (context) => GSVStack(
              space: GSVstackSpaces.$md,
              mainAxisAlignment: MainAxisAlignment.center,
              isReversed: true,
              children: [
                GSBox(
                  style:
                      GSStyle(height: 100, width: 100, bg: $GSColors.blue300),
                  child: const Text('1'),
                ),
                GSBox(
                  style:
                      GSStyle(height: 100, width: 100, bg: $GSColors.blue400),
                  child: const Text('2'),
                ),
                GSBox(
                  style:
                      GSStyle(height: 100, width: 100, bg: $GSColors.blue500),
                  child: const Text('3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
