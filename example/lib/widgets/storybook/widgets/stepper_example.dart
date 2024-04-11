import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

import '../../components/layout/text_input.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];

  final List dropdownStepStateOptions = [
    GSStepState.indexed,
    GSStepState.editing,
    GSStepState.complete,
    GSStepState.disabled,
    GSStepState.inactive,
    GSStepState.error
  ];
  GSSizes selectedSizeOption = GSSizes.$md;

  GSStepState selectedStepStateOption = GSStepState.indexed;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  void updateStepStateSelectedOption(dynamic newOption) {
    setState(() {
      selectedStepStateOption = newOption;
    });
  }

  int _index = 0;

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    return CustomGSLayout(
      title: "Stepper",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
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
                title: const Text(
                  "Onboarding",
                ),
                state: selectedStepStateOption,
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
              GSStep(
                title: Text(_titleController.text),
                content: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(_contentController.text),
                ),
              ),
            ],
            //keepAllContentAlive: true,
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
              CustomDropDown(
                title: "StepState",
                dropdownOptions: dropdownStepStateOptions,
                selectedOption: selectedStepStateOption,
                onChanged: updateStepStateSelectedOption,
              ),
              const SizedBox(height: 20),
              CustomInput(
                title1: "Step Title",
                title2: "Step Content",
                controller1: _titleController,
                controller2: _contentController,
                onChanged: (String, dynamic) {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
