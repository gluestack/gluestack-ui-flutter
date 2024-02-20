import 'package:storybook_flutter/storybook_flutter.dart';

abstract class StoryWidget {
  StoryWidget() {
    _story = createStoryWidget();
  }

  late final Story _story;

  ///
  /// Name for this storybook widget
  ///
  String get storyName;

  ///
  /// Get screen route name for go router.
  ///
  String get routePath;

  ///
  /// Get the story widget that is returned from [createStoryWidget] method.
  ///
  Story get story => _story;

  ///
  /// Create the widget to be used in the story.
  ///
  Story createStoryWidget();
}
