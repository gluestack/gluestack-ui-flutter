import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSProgressSizes.$xs.name),
  Option<int>(value: 1, label: GSProgressSizes.$sm.name),
  Option<int>(value: 2, label: GSProgressSizes.$md.name),
  Option<int>(value: 3, label: GSProgressSizes.$lg.name),
  Option<int>(value: 4, label: GSProgressSizes.$xl.name),
  Option<int>(value: 5, label: GSProgressSizes.$2xl.name),
];

final class ProgressStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSProgress(
        size: GSProgressSizes.values[context.knobs
            .options(label: 'Size', initial: 3, options: sizeOptions)],
        value: 0.4,
      ),
    );
  }

  @override
  String get routePath => "progress-preview";

  @override
  String get storyName => "Progress";
}
