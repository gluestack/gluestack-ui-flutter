import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions =
    generateEnumOptions(GSCheckBoxSizes.values);

final class CheckboxStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSCheckBox(
        size: GSCheckBoxSizes.values[context.knobs
            .options(label: 'Size', initial: 0, options: sizeOptions)],
        isInvalid: context.knobs.boolean(label: "isInvalid", initial: false),
        isDisabled: context.knobs.boolean(label: "isDisabled", initial: false),
        icon: GSCheckBoxIndicator(
          style: GlueStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
          child: const GSCheckBoxIcon(),
        ),
        value: "value 1",
        onChanged: (value) {},
        label: const GSCheckBoxLabel(text: "value1"),
      ),
    );
  }

  @override
  String get routePath => "checkbox-preview";

  @override
  String get storyName => "Checkbox";
}
