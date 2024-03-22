import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSIconButtonSizes.$sm.name),
  Option<int>(value: 1, label: GSIconButtonSizes.$md.name),
  Option<int>(value: 2, label: GSIconButtonSizes.$lg.name),
];

final class IconButtonStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSIconButton(
        size: GSIconButtonSizes.values[context.knobs
            .options(label: 'Size', initial: 1, options: sizeOptions)],
        style: GSStyle(borderRadius: 99, bg: const Color(0xff00aaff)),
        icon: GSIcon(
          icon: Icons.add_a_photo,
          style: GSStyle(color: const Color(0xffffffff)),
        ),
        onPressed: () {
          // print('Icon Button Pressed!');
        },
      ),
    );
  }

  @override
  String get routePath => "icon-button-preview";

  @override
  String get storyName => "IconButton";
}
