import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class SpinnerStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSSpinner(
        strokeWidth: 4,
        style: GSStyle(
          bg: $GSColors.blueGray300,
          width: 30,
          height: 30,
        ),
      ),
    );
  }

  @override
  String get routePath => "spinner-preview";

  @override
  String get storyName => "Spinner";
}
