import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSVariants enum order.
final List<Option<int>> variantOptions = [
  Option<int>(value: 0, label: GSInputVariants.outline.name),
  Option<int>(value: 1, label: GSInputVariants.rounded.name),
  Option<int>(value: 2, label: GSInputVariants.underlined.name),
];

//Need to add value according to GSSizes enum order.
List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSInputSizes.$sm.name),
  Option<int>(value: 1, label: GSInputSizes.$md.name),
  Option<int>(value: 2, label: GSInputSizes.$lg.name),
  Option<int>(value: 3, label: GSInputSizes.$xl.name),
];

final class InputStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    TextEditingController textEditingController = TextEditingController();
    return Story(
      name: storyName,
      builder: (context) => GSInput(
        variant: GSInputVariants.values[context.knobs
            .options(label: 'Variant', initial: 1, options: variantOptions)],
        size: GSInputSizes.values[context.knobs
            .options(label: 'Size', initial: 3, options: sizeOptions)],
        isDisabled: context.knobs.boolean(label: "isDisabled", initial: false),
        isInvalid: context.knobs.boolean(label: "isInvalid", initial: false),
        isReadOnly: context.knobs.boolean(label: "isReadOnly", initial: false),
        hintText: "Enter text here",
        controller: textEditingController,
        style: GSStyle(
          width: 300,
        ),
      ),
    );
  }

  @override
  String get routePath => "input-preview";

  @override
  String get storyName => "Input";
}
