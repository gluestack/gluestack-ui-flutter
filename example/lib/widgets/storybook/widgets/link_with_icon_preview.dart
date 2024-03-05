import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LinkWithIconPreview extends StatelessWidget {
  const LinkWithIconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Link',
        initialLayout: Layout.compact,
        stories: [
          Story(
            name: 'Link',
            builder: (context) => GSBox(
              style: GSStyle(
                width: 160,
                height: 25,
              ),
              child: GSHStack(
                children: [
                  const GSText(text: 'Go to'),
                  const SizedBox(
                    width: 10,
                  ),
                  GSLink(
                    style: GSStyle(),
                    url: 'https://gluestack.io/',
                    text: GSLinkText(
                      text: 'gluestack',
                      style: GSStyle(textStyle: const TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const GSIcon(icon: Icons.arrow_circle_right_outlined)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
