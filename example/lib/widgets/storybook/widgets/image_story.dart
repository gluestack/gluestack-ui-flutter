import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions = generateEnumOptions(GSImageSizes.values);

final List<Option<int>> borderRadiusOptions =
    generateEnumOptions(GSImageRadius.values);

final class ImageStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSImage(
        size: GSImageSizes.values[context.knobs.options(
            label: 'Size',
            initial: (GSImageSizes.values.length - 1) ~/ 2,
            options: sizeOptions)],
        borderRadius: GSImageRadius.values[context.knobs.options(
            label: 'Border Radius',
            initial: (GSImageRadius.values.length - 1) ~/ 2,
            options: borderRadiusOptions)],
        path:
            'https://plus.unsplash.com/premium_photo-1697211174198-18da849f87c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5OTI2NTM4Mg&ixlib=rb-4.0.3&q=80&w=1080',
        imageType: GSImageType.network,
      ),
    );
  }

  @override
  String get routePath => "image-preview";

  @override
  String get storyName => "Image";
}
