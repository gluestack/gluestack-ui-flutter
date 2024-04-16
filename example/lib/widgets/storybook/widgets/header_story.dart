import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class HeaderStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSVStack(
        children: [
          const GSHeader(
            centerChild: true,
            child: GSText(
              text: 'GS Header',
            ),
          ),
          GSBox(
            style: GSStyle(
                margin: const EdgeInsets.all(4),
                height: 30,
                width: double.infinity,
                color: $GSColors.amber400,
                borderRadius: 12),
          ),
          GSBox(
            style: GSStyle(
                margin: const EdgeInsets.all(4),
                height: 30,
                width: double.infinity,
                color: $GSColors.red400,
                borderRadius: 12),
          ),
          GSBox(
            style: GSStyle(
                margin: const EdgeInsets.all(4),
                height: 30,
                width: double.infinity,
                color: $GSColors.green400,
                borderRadius: 12),
          ),
        ],
      ),
    );
  }

  @override
  String get routePath => "header-preview";

  @override
  String get storyName => "Header";
}
