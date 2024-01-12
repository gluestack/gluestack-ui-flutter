import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class MultipleCheckboxHorizontalPreview extends StatelessWidget {
  const MultipleCheckboxHorizontalPreview({super.key});

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
              style: GSStyle(width: 400, height: 50),
              child: GSHStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    width: 20,
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
                    width: 20,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
