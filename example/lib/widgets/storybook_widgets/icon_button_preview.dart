import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class IconButtonPreview extends StatelessWidget {
  const IconButtonPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Button',
        stories: [
          Story(
            name: 'Button',
            builder: (context) => GSButton(
              style: GSStyle(width: 55, height: 55, borderRadius: 30),
              child: const GSButtonIcon(
                icon: Icons.calendar_view_week_outlined,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
