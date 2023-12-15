import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LinkPreview extends StatelessWidget {
  const LinkPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Link',
      stories: [
        Story(
          name: 'Link',
          description:
              'With links, users can navigate seamlessly throughout a website. This component has a hyperlinked appearance for a user-friendly experience.',
          builder: (context) => GSLink(
            style: GSStyle(),
            url: 'https://gluestack.io/',
            text: const GSLinkText(text: 'gluestack'),
          ),
        ),
      ],
    );
  }
}
