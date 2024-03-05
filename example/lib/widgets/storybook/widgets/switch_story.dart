import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSSwitchSizes.$sm.name),
  Option<int>(value: 1, label: GSSwitchSizes.$md.name),
  Option<int>(value: 2, label: GSSwitchSizes.$lg.name),
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
      size: GSSwitchSizes.values[context.knobs
          .options(label: 'Size', initial: 1, options: sizeOptions)],
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
  String get routePath => "switch-preview";

  @override
  String get storyName => "Switch";
}
