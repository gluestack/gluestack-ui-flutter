import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSAvatarSizes.$xs.name),
  Option<int>(value: 1, label: GSAvatarSizes.$sm.name),
  Option<int>(value: 2, label: GSAvatarSizes.$md.name),
  Option<int>(value: 3, label: GSAvatarSizes.$lg.name),
  Option<int>(value: 4, label: GSAvatarSizes.$xl.name),
  Option<int>(value: 5, label: GSAvatarSizes.$2xl.name),
];

//Need to add value according to GSSizes enum order.
final List<Option<int>> borderRadiusOptions = [
  Option<int>(value: 0, label: GSAvatarRadius.$none.name),
  Option<int>(value: 1, label: GSAvatarRadius.$xs.name),
  Option<int>(value: 2, label: GSAvatarRadius.$sm.name),
  Option<int>(value: 3, label: GSAvatarRadius.$md.name),
  Option<int>(value: 4, label: GSAvatarRadius.$lg.name),
  Option<int>(value: 5, label: GSAvatarRadius.$xl.name),
  Option<int>(value: 6, label: GSAvatarRadius.$2xl.name),
  Option<int>(value: 7, label: GSAvatarRadius.$3xl.name),
  Option<int>(value: 8, label: GSAvatarRadius.$full.name),
];

final class AvatarStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSAvatar(
        size: GSAvatarSizes.values[context.knobs
            .options(label: 'Size', initial: 2, options: sizeOptions)],
        radius: GSAvatarRadius.values[context.knobs.options(
            label: 'Border Radius', initial: 8, options: borderRadiusOptions)],
        style: GSStyle(
          bg: Colors.orange,
          textStyle: const TextStyle(color: Colors.white),
        ),
        fallBackText: const GSAvatarFallBackText('Geeky Stack'),
      ),
    );
  }

  @override
  String get routePath => "avatar-preview";

  @override
  String get storyName => "Avatar";
}
