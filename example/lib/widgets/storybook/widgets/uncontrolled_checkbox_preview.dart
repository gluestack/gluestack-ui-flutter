import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class UncontrolledCheckboxPreview extends StatelessWidget {
  const UncontrolledCheckboxPreview({super.key});

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
                    value: "Appartments",
                    onChanged: (value) {},
                    label: const GSCheckBoxLabel(text: "Appartments"),
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
                    value: "Residents",
                    onChanged: (value) {},
                    label: const GSCheckBoxLabel(text: "Residents"),
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
