import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSActions enum order.
final List<Option<int>> actionOptions = [
  Option<int>(value: 0, label: GSButtonActions.primary.name),
  Option<int>(value: 1, label: GSButtonActions.secondary.name),
  Option<int>(value: 2, label: GSButtonActions.positive.name),
  Option<int>(value: 3, label: GSButtonActions.negative.name),
];
//Need to add value according to GSVariants enum order.
final List<Option<int>> variantOptions = [
  Option<int>(value: 0, label: GSButtonVariants.solid.name),
  Option<int>(value: 1, label: GSButtonVariants.outline.name),
  Option<int>(value: 2, label: GSButtonVariants.link.name),
];
//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSButtonSizes.$xs.name),
  Option<int>(value: 1, label: GSButtonSizes.$sm.name),
  Option<int>(value: 2, label: GSButtonSizes.$md.name),
  Option<int>(value: 3, label: GSButtonSizes.$lg.name),
];

final class ButtonStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSButton(
        action: GSButtonActions.values[context.knobs
            .options(label: 'Action', initial: 0, options: actionOptions)],
        variant: GSButtonVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)],
        size: GSButtonSizes.values[context.knobs
            .options(label: 'Size', initial: 2, options: sizeOptions)],
        isDisabled: context.knobs.boolean(label: "isDisabled", initial: false),
        isFocusVisible:
            context.knobs.boolean(label: "isFocusVisible", initial: false),
        child: const Row(
          children: [GSButtonText(text: "Add"), GSButtonIcon(icon: Icons.add)],
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  String get routePath => "button-preview";

  @override
  String get storyName => "Button";
}
