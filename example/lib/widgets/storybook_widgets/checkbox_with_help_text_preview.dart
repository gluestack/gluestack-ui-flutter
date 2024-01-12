import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CheckboxWithHelpTextPreview extends StatelessWidget {
  const CheckboxWithHelpTextPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Checkbox',
        stories: [
          Story(
            name: 'Checkbox',
            builder: (context) => Center(
              child: GSBox(
                style: GSStyle(width: 400, height: 150),
                child: GSVStack(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GSCheckBox(
                      icon: GSCheckBoxIndicator(
                        style: GSStyle(
                            margin: EdgeInsets.only(
                          right: $GSSpace.$4,
                        )),
                        child: const GSCheckBoxIcon(),
                      ),
                      value: "Design",
                      onChanged: (value) {},
                      label: const GSVStack(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GSCheckBoxLabel(text: "Design"),
                          GSText(
                              text: 'Subscribe to updates from the Design Feed')
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GSCheckBox(
                      icon: GSCheckBoxIndicator(
                        style: GSStyle(
                            margin: EdgeInsets.only(
                          right: $GSSpace.$4,
                        )),
                        child: const GSCheckBoxIcon(),
                      ),
                      value: "Marketing",
                      onChanged: (value) {},
                      label: const GSVStack(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GSCheckBoxLabel(text: "Marketing"),
                          GSText(
                              text:
                                  'Subscribe to updates from the Marketing Feed')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
