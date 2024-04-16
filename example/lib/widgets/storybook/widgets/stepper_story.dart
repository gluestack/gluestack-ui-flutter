import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.

final List<Option<int>> sizeOptions =
    generateEnumOptions(GSStepperSizes.values);

List<Option<int>> stateOptions = [
  Option<int>(value: 0, label: GSStepState.indexed.name),
  Option<int>(value: 1, label: GSStepState.editing.name),
  Option<int>(value: 2, label: GSStepState.complete.name),
  Option<int>(value: 3, label: GSStepState.disabled.name),
  Option<int>(value: 4, label: GSStepState.inactive.name),
  Option<int>(value: 5, label: GSStepState.error.name),
];

class _StepperStory extends StatefulWidget {
  const _StepperStory();

  @override
  State<_StepperStory> createState() => ___StepperStoryState();
}

class ___StepperStoryState extends State<_StepperStory> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return GSStepper(
      keepAllContentAlive: false,
      currentStep: _index,
      size: GSStepperSizes.values
          .where((element) =>
              element.name ==
              sizeOptions[context.knobs.options(
                      label: 'Sizes', initial: 0, options: sizeOptions)]
                  .label)
          .first,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <GSStep>[
        GSStep(
          title: const Text('Onboarding'),
          state: GSStepState.values[context.knobs
              .options(label: 'State', initial: 0, options: stateOptions)],
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Welcome!!'),
          ),
        ),
        GSStep(
          title: const Text('Project Setup'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Setup the base project.'),
          ),
        ),
        GSStep(
          title: const Text('Code'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Start your coding journey.'),
          ),
        ),
      ],
    );
  }
}

final class StepperStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => const _StepperStory(),
    );
  }

  @override
  String get routePath => "stepper-preview";

  @override
  String get storyName => "Stepper";
}
