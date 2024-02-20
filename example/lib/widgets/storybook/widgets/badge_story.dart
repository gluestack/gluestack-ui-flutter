import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSActions enum order.
final List<Option<int>> actionOptions = [
  Option<int>(value: 0, label: GSBadgeActions.error.name),
  Option<int>(value: 1, label: GSBadgeActions.warning.name),
  Option<int>(value: 2, label: GSBadgeActions.success.name),
  Option<int>(value: 3, label: GSBadgeActions.info.name),
  Option<int>(value: 4, label: GSBadgeActions.muted.name),
];
//Need to add value according to GSVariants enum order.
final List<Option<int>> variantOptions = [
  Option<int>(value: 0, label: GSBadgeVariants.solid.name),
  Option<int>(value: 1, label: GSBadgeVariants.outline.name),
];
//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSBadgeSizes.$sm.name),
  Option<int>(value: 1, label: GSBadgeSizes.$md.name),
  Option<int>(value: 2, label: GSBadgeSizes.$lg.name),
];

//Need to add value according to GSSizes enum order.
final List<Option<int>> borderRadiusOptions = [
  Option<int>(value: 0, label: GSBadgeRadius.$none.name),
  Option<int>(value: 1, label: GSBadgeRadius.$xs.name),
  Option<int>(value: 2, label: GSBadgeRadius.$sm.name),
  Option<int>(value: 3, label: GSBadgeRadius.$md.name),
  Option<int>(value: 4, label: GSBadgeRadius.$lg.name),
  Option<int>(value: 5, label: GSBadgeRadius.$xl.name),
  Option<int>(value: 6, label: GSBadgeRadius.$2xl.name),
  Option<int>(value: 7, label: GSBadgeRadius.$3xl.name),
  Option<int>(value: 8, label: GSBadgeRadius.$full.name),
];

final class BadgeStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      // description:
      //     'The badge component lets you quickly and easily add status indicators to your interface for improved usability.',
      builder: (context) => GSBadge(
        action: GSBadgeActions.values[context.knobs
            .options(label: 'Action', initial: 3, options: actionOptions)],
        variant: GSBadgeVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)],
        size: GSBadgeSizes.values[context.knobs
            .options(label: 'Size', initial: 1, options: sizeOptions)],
        borderRadius: GSBadgeRadius.values[context.knobs.options(
            label: 'Border Radius', initial: 0, options: borderRadiusOptions)],
        text: const GSBadgeText("New Feature"),
        style: GSStyle(),
      ),
    );
  }

  @override
  String get routePath => "badge-preview";

  @override
  String get storyName => "Badge";
}
