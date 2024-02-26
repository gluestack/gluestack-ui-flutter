import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSIconSizes.$xs.name),
  Option<int>(value: 1, label: GSIconSizes.$sm.name),
  Option<int>(value: 2, label: GSIconSizes.$md.name),
  Option<int>(value: 3, label: GSIconSizes.$lg.name),
  Option<int>(value: 4, label: GSIconSizes.$xl.name),
];

final class IconStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSIcon(
        size: GSIconSizes.values[context.knobs
            .options(label: 'Size', initial: 2, options: sizeOptions)],
        icon: Icons.calendar_month,
      ),
    );
  }

  @override
  String get routePath => "icon-preview";

  @override
  String get storyName => "Icon";
}
