import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> actionOptions =
    generateEnumOptions(GSAlertBoxActions.values);
final List<Option<int>> variantOptions =
    generateEnumOptions(GSAlertBoxVariants.values);

final class AlertStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSAlert(
        icon: const GSAlertBoxIcon(
          iconData: Icons.info_outline,
        ),
        action: GSAlertBoxActions.values[context.knobs
            .options(label: 'Action', initial: 0, options: actionOptions)],
        variant: GSAlertBoxVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)],
        style: GSStyle(),
        description: const GSAlertText("Description of Alert!"),
      ),
    );
  }

  @override
  String get routePath => "alert-preview";

  @override
  String get storyName => "Alert";
}
