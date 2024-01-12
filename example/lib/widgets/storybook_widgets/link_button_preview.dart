import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LinkButtonPreview extends StatelessWidget {
  const LinkButtonPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Button',
        initialLayout: Layout.compact,
        stories: [
          Story(
            name: 'Button',
            builder: (context) => GSButton(
              variant: GSVariants.link,
              style: GSStyle(
                  color: Colors.transparent,
                  onHover: GSStyle(bg: Colors.transparent)),
              child: const GSText(text: 'Back to top'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
