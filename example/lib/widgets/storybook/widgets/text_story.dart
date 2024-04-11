import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class TextStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSText(
        text: 'This is an example of a simple text.',
        // bold: true,
        // underline: true,
        style: GSStyle(
          textStyle: TextStyle(letterSpacing: $GSLetterSpacing.$lg),
        ),
      ),
    );
  }

  @override
  String get routePath => "text-preview";

  @override
  String get storyName => "Text";
}

class TextPreview extends StatelessWidget {
  const TextPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Text',
        stories: [
          Story(
            name: 'Text',
            builder: (context) => GSText(
              text: 'test 1',
              bold: true,
              underline: true,
              style: GSStyle(
                textStyle: TextStyle(letterSpacing: $GSLetterSpacing.$lg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
