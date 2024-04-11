import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> actionOptions = generateEnumOptions(GSBadgeActions.values);
final List<Option<int>> variantOptions = generateEnumOptions(GSBadgeVariants.values);
final List<Option<int>> sizeOptions = generateEnumOptions(GSBadgeSizes.values);
final List<Option<int>> borderRadiusOptions = generateEnumOptions(GSBadgeRadius.values);

final class BadgeStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      // description:
      //     'The badge component lets you quickly and easily add status indicators to your interface for improved usability.',
      builder: (context) => GSBadge(
        action: GSBadgeActions.values[context.knobs
            .options(label: 'Action', initial: 0, options: actionOptions)],
        variant: GSBadgeVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)],
        size: GSBadgeSizes.values[context.knobs
            .options(label: 'Size', initial: 0, options: sizeOptions)],
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
