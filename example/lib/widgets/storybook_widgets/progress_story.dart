import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 1, label: GSSizes.$xs.name),
  Option<int>(value: 2, label: GSSizes.$sm.name),
  Option<int>(value: 3, label: GSSizes.$md.name),
  Option<int>(value: 4, label: GSSizes.$lg.name),
  Option<int>(value: 5, label: GSSizes.$xl.name),
  Option<int>(value: 6, label: GSSizes.$2xl.name),
];

final class ProgressStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSProgress(
        size: GSSizes.values[context.knobs
            .options(label: 'Size', initial: 3, options: sizeOptions)],
        value: 0.4,
      ),
    );
  }

  @override
  String get routePath => "progressPreview";

  @override
  String get storyName => "Progress";
}
