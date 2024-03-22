import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];
  GSSizes selectedSizeOption = GSSizes.$md;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''

GSStepper(
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

          
  ''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Stepper",
          size: GSSizes.$xl,
        ),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSStepper(
            size: selectedSizeOption,
            currentStep: _index,
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
            // keepAllContentAlive: true,
          ),
          controls: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                title: "size",
                dropdownOptions: dropdownSizeOptions,
                selectedOption: selectedSizeOption,
                onChanged: updateSizeSelectedOption,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
