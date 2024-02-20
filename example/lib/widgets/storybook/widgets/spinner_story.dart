import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class SpinnerStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => const GSSpinner(),
    );
  }

  @override
  String get routePath => "spinner-preview";

  @override
  String get storyName => "Spinner";
}
