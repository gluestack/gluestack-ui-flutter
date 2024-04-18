import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions = generateEnumOptions(GSIconSizes.values);

final class IconStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSIcon(
        size: GSIconSizes.values[context.knobs.options(
            label: 'Size',
            initial: GSIconSizes.values.length - 1,
            options: sizeOptions)],
        icon: Icons.calendar_month,
      ),
    );
  }

  @override
  String get routePath => "icon-preview";

  @override
  String get storyName => "Icon";
}
