import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSImageSizes.$2xs.name),
  Option<int>(value: 1, label: GSImageSizes.$xs.name),
  Option<int>(value: 2, label: GSImageSizes.$sm.name),
  Option<int>(value: 3, label: GSImageSizes.$md.name),
  Option<int>(value: 4, label: GSImageSizes.$lg.name),
  Option<int>(value: 5, label: GSImageSizes.$xl.name),
  Option<int>(value: 6, label: GSImageSizes.$2xl.name),
];

//Need to add value according to GSSizes enum order.
final List<Option<int>> borderRadiusOptions = [
  Option<int>(value: 0, label: GSImageRadius.$none.name),
  Option<int>(value: 1, label: GSImageRadius.$xs.name),
  Option<int>(value: 2, label: GSImageRadius.$sm.name),
  Option<int>(value: 3, label: GSImageRadius.$md.name),
  Option<int>(value: 4, label: GSImageRadius.$lg.name),
  Option<int>(value: 5, label: GSImageRadius.$xl.name),
  Option<int>(value: 6, label: GSImageRadius.$2xl.name),
  Option<int>(value: 7, label: GSImageRadius.$3xl.name),
  Option<int>(value: 8, label: GSImageRadius.$full.name),
];

final class ImageStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSImage(
        size: GSImageSizes.values[context.knobs
            .options(label: 'Size', initial: 3, options: sizeOptions)],
        borderRadius: GSImageRadius.values[context.knobs.options(
            label: 'Border Radius', initial: 0, options: borderRadiusOptions)],
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
