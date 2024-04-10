import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions = generateEnumOptions(GSSwitchSizes.values);

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
          .options(label: 'Size', initial: GSSwitchSizes.values.length-1, options: sizeOptions)],
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
