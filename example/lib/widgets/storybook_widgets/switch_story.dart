import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 2, label: GSSizes.$sm.name),
  Option<int>(value: 3, label: GSSizes.$md.name),
  Option<int>(value: 4, label: GSSizes.$lg.name),
];

class _SwitchStory extends StatefulWidget {
  const _SwitchStory();

  @override
  State<_SwitchStory> createState() => __SwitchStoryState();
}

class __SwitchStoryState extends State<_SwitchStory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GSSwitch(
      size: GSSizes.values[context.knobs
          .options(label: 'Size', initial: 3, options: sizeOptions)],
      value: isSelected,
      isDisabled: context.knobs.boolean(label: 'isDisabled'),
      onToggle: (value) {
        setState(() {
          isSelected = value;
        });
      },
    );
  }
}

final class SwitchStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => const _SwitchStory(),
    );
  }

  @override
  String get routePath => "switchPreview";

  @override
  String get storyName => "Switch";
}
