import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions = generateEnumOptions(GSFABSizes.values);

final List<Option<int>> placementOptions =
    generateEnumOptions(GSPlacements.values);

final class FabStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSCenter(
        child: Stack(
          children: [
            GSBox(
              style: GlueStyle(
                height: 360,
                width: 320,
                borderRadius: $GSRadii.$md,
                bg: $GSColors.backgroundLight50,
                dark: GlueStyle(color: $GSColors.backgroundDark900),
              ),
            ),
            GSFab(
              size: GSFABSizes.values[context.knobs
                  .options(label: 'Size', initial: 0, options: sizeOptions)],
              placement: GSFABPlacements.values
                  .where((element) =>
                      element.name ==
                      placementOptions[context.knobs.options(
                              label: 'Placements',
                              initial: 0,
                              options: placementOptions)]
                          .label)
                  .first,
              isHovered:
                  context.knobs.boolean(label: "isHovered", initial: false),
              isDisabled:
                  context.knobs.boolean(label: "isDisabled", initial: false),
              isPressed:
                  context.knobs.boolean(label: "isPressed", initial: false),
              onPressed: () {
                // print('fab pressed!');
              },
              icon: const GSFabIcon(icon: Icons.add),
              label: const GSFabLabel(text: 'Quick Start'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String get routePath => "fab-preview";

  @override
  String get storyName => "Fab";
}
