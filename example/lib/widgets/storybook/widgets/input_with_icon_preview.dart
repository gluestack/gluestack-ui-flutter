import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class InputWithIconPreview extends StatelessWidget {
  const InputWithIconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Input',
        initialLayout: Layout.compact,
        stories: [
          Story(
            name: 'Input',
            builder: (context) => GSBox(
              style: GSStyle(
                width: 250,
              ),
              child: const GSInput(
                prefixIcon: GSIcon(icon: Icons.search),
                obscureText: true,
                hintText: 'Search...',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
