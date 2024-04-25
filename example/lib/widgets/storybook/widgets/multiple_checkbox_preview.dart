import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class MultipleCheckboxPreview extends StatelessWidget {
  const MultipleCheckboxPreview({super.key});

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
              style: GSStyle(width: 150, height: 200),
              child: GSVStack(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
