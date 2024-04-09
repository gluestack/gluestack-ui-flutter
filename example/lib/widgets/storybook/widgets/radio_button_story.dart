import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '../../components/widgets/public.dart';
import 'base_story_widget.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSRadioSizes.$sm.name),
  Option<int>(value: 1, label: GSRadioSizes.$md.name),
  Option<int>(value: 2, label: GSRadioSizes.$lg.name),
];

class _RadioButtonExample extends StatefulWidget {
  const _RadioButtonExample();

  @override
  State<_RadioButtonExample> createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<_RadioButtonExample> {
  Value groupValue = Value.one;

  @override
  Widget build(BuildContext context) {
    return GSRadio<Value>(
      size: GSRadioSizes.values[context.knobs
          .options(label: 'Size', initial: 1, options: sizeOptions)],
      isInvalid: context.knobs.boolean(label: "isInvalid", initial: false),
      isDisabled: context.knobs.boolean(label: "isDisabled", initial: false),
      value: Value.four,
      groupValue: groupValue,
      onChanged: (p0) {
        setState(() {
          groupValue = p0!;
        });
      },
      icon: const GSRadioIcon<Value>(),
      label: const GSRadioText<Value>(text: 'text'),
      style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
    );
  }
}

final class RadioButtonStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => const _RadioButtonExample(),
    );
  }

  @override
  String get routePath => "radio-button-preview";

  @override
  String get storyName => "Radio Button";
}
