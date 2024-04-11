import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions = generateEnumOptions(GSAvatarSizes.values);
final List<Option<int>> borderRadiusOptions =
    generateEnumOptions(GSAvatarRadius.values);

final class AvatarStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSAvatar(
        size: GSAvatarSizes.values[context.knobs
            .options(label: 'Size', initial:  GSAvatarSizes.values.length-1, options: sizeOptions)],
        radius: GSAvatarRadius.values[context.knobs.options(
            label: 'Border Radius', initial: GSAvatarRadius.values.length-1, options: borderRadiusOptions)],
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
