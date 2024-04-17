import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> variantOptions =
    generateEnumOptions(GSInputVariants.values);

final List<Option<int>> sizeOptions = generateEnumOptions(GSInputSizes.values);

final class InputStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    TextEditingController textEditingController = TextEditingController();
    return Story(
      name: storyName,
      builder: (context) => GSInput(
        variant: GSInputVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)],
        size: GSInputSizes.values[context.knobs
            .options(label: 'Size', initial: 0, options: sizeOptions)],
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
