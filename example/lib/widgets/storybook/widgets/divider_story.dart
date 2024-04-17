import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'base_story_widget.dart';

final class DividerStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Easy"),
          ),
          GSDivider(
            orientation: GSOrientations.vertical,
            style: GSStyle(height: 30),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Difficult"),
          ),
        ],
      ),
    );
  }

  @override
  String get routePath => "divider-preview";

  @override
  String get storyName => "Divider";
}
