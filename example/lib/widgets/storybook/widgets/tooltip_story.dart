import 'package:flutter/material.dart';
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
    return SuperTooltip(
      distance: 50,
      backgroundColor : Colors.green,
      toggleOnTap: true,
      content: "tooltip gjhfgddxzc khjyftdgfxdcv khjyfhtdfcgvhmbnhyutfjh \n leshfl \n kjsebvjkb lksnfkl \n kjsbvkjnw",
      popupDirection: GSTooltipPosition.values[context.knobs
          .options(label: 'Placement', initial: 0, options: placementsOptions)],
      child: Container(
        color: Colors.indigo,
        child: const Text("Hover"),
      ),
    );
  }
}
