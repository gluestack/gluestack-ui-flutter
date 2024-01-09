import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class LinkStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSLink(
        style: GSStyle(),
        url: 'https://gluestack.io/',
        text: const GSLinkText(text: 'gluestack'),
      ),
    );
  }

  @override
  String get routePath => "linkPreview";

  @override
  String get storyName => "Link";
}
