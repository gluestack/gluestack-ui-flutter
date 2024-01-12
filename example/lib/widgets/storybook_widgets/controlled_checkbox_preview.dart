import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ControlledCheckboxPreview extends StatelessWidget {
  const ControlledCheckboxPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Checkbox',
        initialLayout: Layout.compact,
        stories: [
          Story(
            name: 'Checkbox',
            builder: (context) => GSBox(
              style: GSStyle(width: 150, height: 200),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSCheckBox(
                    isChecked: true,
                    icon: GSCheckBoxIndicator(
                      style:
                          GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                      child: const GSCheckBoxIcon(),
                    ),
                    value: "Flutter",
                    onChanged: (value) {},
                    label: const GSCheckBoxLabel(text: "Flutter"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSCheckBox(
                    icon: GSCheckBoxIndicator(
                      style:
                          GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                      child: const GSCheckBoxIcon(),
                    ),
                    value: "React",
                    onChanged: (value) {},
                    label: const GSCheckBoxLabel(text: "React"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSCheckBox(
                    icon: GSCheckBoxIndicator(
                      style:
                          GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                      child: const GSCheckBoxIcon(),
                    ),
                    isChecked: true,
                    value: "React Native",
                    onChanged: (value) {},
                    label: const GSCheckBoxLabel(text: "React Native"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
