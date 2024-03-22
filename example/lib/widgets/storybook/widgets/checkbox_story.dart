import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSSizes.$sm.name),
  Option<int>(value: 1, label: GSSizes.$md.name),
  Option<int>(value: 2, label: GSSizes.$lg.name),
];

final class CheckboxStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSCheckBox(
        size: GSCheckBoxSizes.values[context.knobs
            .options(label: 'Size', initial: 1, options: sizeOptions)],
        isInvalid: context.knobs.boolean(label: "isInvalid", initial: false),
        isDisabled: context.knobs.boolean(label: "isDisabled", initial: false),
        icon: GSCheckBoxIndicator(
          style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
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
