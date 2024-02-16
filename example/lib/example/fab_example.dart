import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';
import 'package:gluestack_ui_example/widgets/drop_down.dart';
import 'package:gluestack_ui_example/widgets/toggle.dart';

class FabExample extends StatefulWidget {
  const FabExample({super.key});

  @override
  State<FabExample> createState() => _FabExampleState();
}

class _FabExampleState extends State<FabExample> {
  final List dropdownSizeOptions = [
    GSFABSizes.$sm,
    GSFABSizes.$md,
    GSFABSizes.$lg
  ];
  final List dropdownPlacementOptions = [
    GSFABPlacements.bottomCenter,
    GSFABPlacements.bottomLeft,
    GSFABPlacements.bottomRight,
    GSFABPlacements.topCenter,
    GSFABPlacements.topLeft,
    GSFABPlacements.topRight
  ];
  GSFABSizes selectedSizeOption = GSFABSizes.$md;
  GSFABPlacements selectedPlacementOption = GSFABPlacements.bottomRight;
  bool isDisabled = false;
  bool isHovered = false;
  bool isPressed = false;
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  void updatePlacementSelectedOption(dynamic newOption) {
    setState(() {
      selectedPlacementOption = newOption;
    });
  }

  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  void updateIsHovered(bool value) {
    setState(() {
      isHovered = value;
    });
  }

  void updateIsPressed(bool value) {
    setState(() {
      isPressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    const code = """
              GSFab(
                  size: GSFABSizes.\$md,
                  placement: GSFABPlacements.bottomRight,
                  onPressed: () {},
                  isDisabled: isDisabled,
                  isHovered: isHovered,
                  isPressed: isPressed,
                  icon: const GSFabIcon(icon: Icons.add),
                  label: const GSFabLabel(text: 'Quick Start'),
               )
""";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floating Action Button"),
      ),
      body: BaseLayout(
        code: code,
        component: Center(
          child: Stack(
            children: [
              GSBox(
                style: GSStyle(
                    height: 360,
                    width: 320,
                    borderRadius: $GSRadii.$md,
                    bg: $GSColors.backgroundLight50,
                    dark: GSStyle(color: $GSColors.backgroundDark900)),
              ),
              GSFab(
                size: selectedSizeOption,
                placement: selectedPlacementOption,
                onPressed: () {
                  print('fab pressed!');
                },
                isDisabled: isDisabled,
                isHovered: isHovered,
                isPressed: isPressed,
                icon: const GSFabIcon(icon: Icons.add),
                label: const GSFabLabel(text: 'Quick Start'),
              ),
            ],
          ),
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
            CustomDropDown(
              title: "placement",
              dropdownOptions: dropdownPlacementOptions,
              selectedOption: selectedPlacementOption,
              onChanged: updatePlacementSelectedOption,
            ),

            const SizedBox(height: 20),
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isHovered",
              value: isHovered,
              onToggle: updateIsHovered,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isPressed",
              value: isPressed,
              onToggle: updateIsPressed,
            ),
            // CustomToggle(
            //   title: "isInvalid",
            //   value: isInvalid,
            //   onToggle: updateIsInvalid,
            // )
          ],
        ),
      ),
    );
  }
}
