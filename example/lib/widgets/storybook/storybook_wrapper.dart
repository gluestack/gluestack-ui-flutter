import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
/// This wrapper is currently used to show widget in docs website iframe.
///
class StorybookWrapper extends StatelessWidget {
  const StorybookWrapper({
    required this.story,
    required this.storyName,
    super.key,
  });

  final String storyName;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialLayout: Layout.compact,
        initialStory: storyName,
        stories: [story],
      ),
    );
  }
}
