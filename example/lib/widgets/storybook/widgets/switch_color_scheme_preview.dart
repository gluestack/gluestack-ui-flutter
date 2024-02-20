import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SwitchWithColorSchemePreview extends StatefulWidget {
  const SwitchWithColorSchemePreview({super.key});

  @override
  State<SwitchWithColorSchemePreview> createState() =>
      _SwitchWithColorSchemePreviewState();
}

class _SwitchWithColorSchemePreviewState
    extends State<SwitchWithColorSchemePreview> {
  bool isSelected = false;
  bool isSelectedTwo = false;
  bool isSelectedThree = false;
  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(initialStory: 'Switch', stories: [
        Story(
            name: 'Switch',
            builder: (context) => GSBox(
                  style: GSStyle(width: 150, height: 120),
                  child: GSVStack(
                    children: [
                      GSSwitch(
                        style: GSStyle(
                            trackColorTrue: $GSColors.red500,
                            onHover: GSStyle(
                              trackColorTrue: $GSColors.red600,
                            )),
                        value: isSelected,
                        onToggle: (value) {
                          setState(() {
                            isSelected = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GSSwitch(
                          style: GSStyle(
                              trackColorTrue: $GSColors.green500,
                              onHover: GSStyle(
                                trackColorTrue: $GSColors.green600,
                              )),
                          value: isSelectedTwo,
                          onToggle: (value) {
                            setState(() {
                              isSelectedTwo = value;
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      GSSwitch(
                          style: GSStyle(
                              trackColorTrue: $GSColors.orange400,
                              onHover: GSStyle(
                                trackColorTrue: $GSColors.orange600,
                              )),
                          value: isSelectedThree,
                          onToggle: (value) {
                            setState(() {
                              isSelectedThree = value;
                            });
                          }),
                    ],
                  ),
                ))
      ]),
    );
  }
}
