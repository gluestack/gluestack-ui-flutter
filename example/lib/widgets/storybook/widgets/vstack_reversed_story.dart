import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'base_story_widget.dart';

final class VStackReversedStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSVStack(
        space: GSVstackSpaces.$md,
        mainAxisAlignment: MainAxisAlignment.center,
        isReversed: true,
        children: [
          GSBox(
            style: GlueStyle(height: 100, width: 100, bg: $GSColors.blue300),
            child: const Text('1'),
          ),
          GSBox(
            style: GlueStyle(height: 100, width: 100, bg: $GSColors.blue400),
            child: const Text('2'),
          ),
          GSBox(
            style: GlueStyle(height: 100, width: 100, bg: $GSColors.blue500),
            child: const Text('3'),
          ),
        ],
      ),
    );
  }

  @override
  String get routePath => "vstack-reversed-preview";

  @override
  String get storyName => "VStack";
}
