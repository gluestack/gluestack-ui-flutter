import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> placementsOptions =
    generateEnumOptions(GSToolTipPlacements.values);

final class ToolTipStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
        name: storyName, builder: (context) => const GSToolTipExample());
  }

  @override
  String get routePath => "tooltip-preview";

  @override
  String get storyName => "Tooltip";
}

class GSToolTipExample extends StatelessWidget {
  const GSToolTipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GSToolTip(
      distance: 10,
      content: "Tooltip",
      placement: GSTooltipPosition.values[context.knobs
          .options(label: 'Placement', initial: 0, options: placementsOptions)],
      enableNotch: context.knobs.boolean(label: "enableNotch", initial: false),
      child:
          const GSBadge(size: GSBadgeSizes.$md, text: GSBadgeText("Hover Me")),
    );
  }
}
