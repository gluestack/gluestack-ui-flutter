import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> variantOptions =
    generateEnumOptions(GSSelectVariants.values);

final List<Option<int>> sizeOptions = generateEnumOptions(GSSelectSizes.values);

final class SelectStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSSelect(
        style: GSStyle(
          width: 300,
        ),
        hintText: GSSelectHeaderText("Select option"),
        icon: const GSSelectIcon(
          iconData: Icons.arrow_drop_down_outlined,
        ),
        variant: GSSelectVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)],
        size: GSSelectSizes.values[context.knobs
            .options(label: 'Size', initial: 0, options: sizeOptions)],
         options: const [
            'UX Research',
            'Web Development',
            'Cross Platform Development Process',
            'UI Designing',
            'Backend Development'
          ], disabledOptions: [
             'Cross Platform Development Process',
            'UI Designing',
          ],
      ),
    );
  }

  @override
  String get routePath => "select-preview";

  @override
  String get storyName => "Select";
}
