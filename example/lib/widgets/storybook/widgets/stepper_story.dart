import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSSizes.$sm.name),
  Option<int>(value: 1, label: GSSizes.$md.name),
  Option<int>(value: 2, label: GSSizes.$lg.name),
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
      keepAllContentOpen: false,
      currentStep: _index,
      size: GSSizes.values[context.knobs
          .options(label: 'Size', initial: 1, options: sizeOptions)],
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
