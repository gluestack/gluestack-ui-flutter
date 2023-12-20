import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class FabPreview extends StatelessWidget {
  const FabPreview({super.key});

  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSSizes enum order.
    List<Option<int>> sizeOptions = [
      Option<int>(value: 2, label: GSSizes.$sm.name),
      Option<int>(value: 3, label: GSSizes.$md.name),
      Option<int>(value: 4, label: GSSizes.$lg.name),
    ];

    List<Option<int>> placementOptions = [
      Option<int>(value: 0, label: GSPlacements.topLeft.name),
      Option<int>(value: 1, label: GSPlacements.topCenter.name),
      Option<int>(value: 2, label: GSPlacements.topRight.name),
      Option<int>(value: 3, label: GSPlacements.bottomLeft.name),
      Option<int>(value: 4, label: GSPlacements.bottomCenter.name),
      Option<int>(value: 5, label: GSPlacements.bottomRight.name),
    ];
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Fab',
        stories: [
          Story(
            name: 'Fab',
            builder: (context) => GSCenter(
              child: Stack(
                children: [
                  GSBox(
                    style: GSStyle(
                        height: 360,
                        width: 320,
                        borderRadius: $GSRadii.$md,
                        bg: $GSColors.backgroundLight50,
                        dark: GSStyle(color: $GSColors.backgroundDark900)),
                  ),
                  GSFab(
                    size: GSSizes.values[context.knobs.options(
                        label: 'Size', initial: 3, options: sizeOptions)],
                    placement: GSPlacements.values[context.knobs.options(
                        label: 'Placement',
                        initial: 5,
                        options: placementOptions)],
                    isHovered: context.knobs
                        .boolean(label: "isHovered", initial: false),
                    isDisabled: context.knobs
                        .boolean(label: "isDisabled", initial: false),
                    isPressed: context.knobs
                        .boolean(label: "isPressed", initial: false),
                    onPressed: () {},
                    icon: const GSFabIcon(icon: Icons.add),
                    label: const GSFabLabel(text: 'Quick Start'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
