import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LinkWithTextPreview extends StatelessWidget {
  const LinkWithTextPreview({super.key});

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
                width: 260,
                height: 30,
              ),
              child: GSHStack(
                children: [
                  const GSText(text: 'Design inspiration from'),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
