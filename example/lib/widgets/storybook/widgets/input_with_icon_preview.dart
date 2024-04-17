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
        stories: [
          Story(
            name: 'Input',
            builder: (context) => GSBox(
              style: GSStyle(
                  width: 250,
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
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
