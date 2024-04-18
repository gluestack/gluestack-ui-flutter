import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions =
    generateEnumOptions(GSProgressSizes.values);

final class ProgressStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSProgress(
        size: GSProgressSizes.values[context.knobs
            .options(label: 'Size', initial: 0, options: sizeOptions)],
        value: 0.4,
      ),
    );
  }

  @override
  String get routePath => "progress-preview";

  @override
  String get storyName => "Progress";
}
