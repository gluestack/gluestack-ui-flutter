import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class FormControlCheckboxPreview extends StatelessWidget {
  const FormControlCheckboxPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Checkbox',
        stories: [
          Story(
            name: 'Checkbox',
            builder: (context) => GSBox(
              style: GSStyle(
                width: 270,
                height: 200,
              ),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GSHeading(text: 'Sign up for newsletters'),
                  const SizedBox(
                    height: 10,
                  ),
                  GSCheckBox(
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
                    value: "React Native",
                    onChanged: (value) {},
                    label: const GSCheckBoxLabel(text: "React Native"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GSText(text: 'Subscribe to newsletters for updates'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
