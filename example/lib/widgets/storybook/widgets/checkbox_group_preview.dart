import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CheckboxGroupPreview extends StatelessWidget {
  const CheckboxGroupPreview({super.key});

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
              style: GSStyle(width: 150, height: 100),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSCheckBox(
                    isDisabled: true,
                    icon: GSCheckBoxIndicator(
                      style:
                          GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                      child: const GSCheckBoxIcon(),
                    ),
                    value: "Disabled",
                    onChanged: (value) {},
                    label: const GSCheckBoxLabel(text: "Disabled"),
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
                    value: "Active",
                    onChanged: (value) {},
                    label: const GSCheckBoxLabel(text: "Active"),
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
