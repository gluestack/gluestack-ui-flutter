import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BadgePreview extends StatelessWidget {
  const BadgePreview({super.key});

  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSActions enum order.
    List<Option<int>> actionOptions = [
      Option<int>(value: 4, label: GSActions.error.name),
      Option<int>(value: 5, label: GSActions.warning.name),
      Option<int>(value: 6, label: GSActions.success.name),
      Option<int>(value: 7, label: GSActions.info.name),
      Option<int>(value: 8, label: GSActions.muted.name),
    ];
    //Need to add value according to GSVariants enum order.
    List<Option<int>> variantOptions = [
      Option<int>(value: 0, label: GSVariants.solid.name),
      Option<int>(value: 1, label: GSVariants.outline.name),
    ];
    //Need to add value according to GSSizes enum order.
    List<Option<int>> sizeOptions = [
      Option<int>(value: 2, label: GSSizes.$sm.name),
      Option<int>(value: 3, label: GSSizes.$md.name),
      Option<int>(value: 4, label: GSSizes.$lg.name),
    ];

    //Need to add value according to GSSizes enum order.
    List<Option<int>> borderRadiusOptions = [
      Option<int>(value: 0, label: GSBorderRadius.$none.name),
      Option<int>(value: 1, label: GSBorderRadius.$xs.name),
      Option<int>(value: 2, label: GSBorderRadius.$sm.name),
      Option<int>(value: 3, label: GSBorderRadius.$md.name),
      Option<int>(value: 4, label: GSBorderRadius.$lg.name),
      Option<int>(value: 5, label: GSBorderRadius.$xl.name),
      Option<int>(value: 6, label: GSBorderRadius.$2xl.name),
      Option<int>(value: 7, label: GSBorderRadius.$3xl.name),
      Option<int>(value: 8, label: GSBorderRadius.$full.name),
    ];

    return Storybook(
      initialStory: 'Badge',
      stories: [
        Story(
          name: 'Badge',
          description:
              'The badge component lets you quickly and easily add status indicators to your interface for improved usability.',
          builder: (context) => GSBadge(
            action: GSActions.values[context.knobs
                .options(label: 'Action', initial: 6, options: actionOptions)],
            variant: GSVariants.values[context.knobs.options(
                label: 'Variant', initial: 0, options: variantOptions)],
            size: GSSizes.values[context.knobs
                .options(label: 'Size', initial: 3, options: sizeOptions)],
            borderRadius: GSBorderRadius.values[context.knobs.options(
                label: 'Border Radius',
                initial: 0,
                options: borderRadiusOptions)],
            text: const GSBadgeText("New Feature"),
          ),
        ),
      ],
    );
  }
}
