import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSActions enum order.
final List<Option<int>> actionOptions = [
  Option<int>(value: 0, label: GSActions.primary.name),
  Option<int>(value: 1, label: GSActions.secondary.name),
  Option<int>(value: 2, label: GSActions.positive.name),
  Option<int>(value: 3, label: GSActions.negative.name),
];
//Need to add value according to GSVariants enum order.
final List<Option<int>> variantOptions = [
  Option<int>(value: 0, label: GSVariants.solid.name),
  Option<int>(value: 1, label: GSVariants.outline.name),
  Option<int>(value: 2, label: GSVariants.link.name),
];
//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 1, label: GSSizes.$xs.name),
  Option<int>(value: 2, label: GSSizes.$sm.name),
  Option<int>(value: 3, label: GSSizes.$md.name),
  Option<int>(value: 4, label: GSSizes.$lg.name),
];

final class ButtonStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSButton(
        action: GSActions.values[context.knobs
            .options(label: 'Action', initial: 0, options: actionOptions)],
        variant: GSVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)],
        size: GSSizes.values[context.knobs
            .options(label: 'Size', initial: 3, options: sizeOptions)],
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
  String get routePath => "buttonPreview";

  @override
  String get storyName => "Button";
}
