import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ButtonGroupPreview extends StatelessWidget {
  const ButtonGroupPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      GSBox(
        style: GSStyle(
          borderColor: $GSColors.warmGray500,
          width: 600,
          height: 200,
          borderRadius: 8,
          borderWidth: 1.2,
        ),
        child: GSHStack(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GSBox(
              style: GSStyle(width: 300),
              child: const GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GSHeading(
                    text: 'Was this page helpful?',
                  ),
                  GSText(
                    text:
                        'We use this feedback to improve the quality of our documentation.',
                  ),
                ],
              ),
            ),
            GSHStack(
              children: [
                GSButton(
                  variant: GSButtonVariants.outline,
                  action: GSButtonActions.secondary,
                  child: GSButtonText(
                    text: "No",
                    style: GSStyle(),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                GSButton(
                  variant: GSButtonVariants.solid,
                  action: GSButtonActions.positive,
                  child: GSButtonText(
                    text: "Yes",
                    style: GSStyle(),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
