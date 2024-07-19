import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';
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
    return Container(
      width: 300, height: 300,
      // style: GSStyle(width: 300, height: 300, color: $GSColors.borderDark100),
      child: GSToolTip(
        placement: GSToolTipPlacements.values[context.knobs.options(
            label: 'Placement', initial: 1, options: placementsOptions)],
        distance: 6,
        style: GSStyle(
            bg: GSTheme.of(context).background100, height: 40, width: 100),
        enableNotch:
            context.knobs.boolean(label: "Enable Notch", initial: false),
        message: 'Tooltip',
        child: Container(
            // key: _childWidgetKey,
            width: 150,
            height: 100,
            color: $GSColors.error200),
      ),
    );
  }
}
