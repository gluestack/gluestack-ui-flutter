import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions = generateEnumOptions(GSSliderSizes.values);

final List<Option<int>> orientationOptions =
    generateEnumOptions(GSOrientations.values);

final class SliderStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
        name: storyName,
        builder: (context) => GSSlider(
            size: GSSliderSizes.values[context.knobs
                .options(label: 'Size', initial: 0, options: sizeOptions)],
            orientation: GSOrientations.values[context.knobs.options(
                label: 'Orientation', initial: 0, options: orientationOptions)],
            isDisabled:
                context.knobs.boolean(label: "isDisabled", initial: false),
            isReversed:
                context.knobs.boolean(label: "isReversed", initial: false),
            minValue: 0,
            maxValue: 10,
            defaultValue: 3));
  }

  @override
  String get routePath => "slider-preview";

  @override
  String get storyName => "Slider";
}
