import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class LinkStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSLink(
        style: GSStyle(),
        url: 'https://www.gluestack.io/',
        text: const GSLinkText(text: 'Go to Gluestack'),
      ),
    );
  }

  @override
  String get routePath => "link-preview";

  @override
  String get storyName => "Link";
}
