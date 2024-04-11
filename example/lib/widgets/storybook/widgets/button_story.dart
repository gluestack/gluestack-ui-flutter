import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> actionOptions =
    generateEnumOptions(GSButtonActions.values);

final List<Option<int>> variantOptions =
    generateEnumOptions(GSButtonVariants.values);

final List<Option<int>> sizeOptions = generateEnumOptions(GSButtonSizes.values);

final class ButtonStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSButton(
        action: GSButtonActions.values[context.knobs
            .options(label: 'Action', initial: 0, options: actionOptions)],
        variant: GSButtonVariants.values[context.knobs
            .options(label: 'Variant', initial: GSButtonVariants.values.length-1, options: variantOptions)],
        size: GSButtonSizes.values[context.knobs
            .options(label: 'Size', initial:  GSButtonSizes.values.length-1, options: sizeOptions)],
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
