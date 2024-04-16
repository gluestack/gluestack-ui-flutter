import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ButtonWithFullWidthPreview extends StatelessWidget {
  const ButtonWithFullWidthPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      GSBox(
        style: GlueStyle(
          borderColor: $GSColors.warmGray500,
          width: 320,
          height: 350,
          borderRadius: 8,
          borderWidth: 1.2,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: GSVStack(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GSVStack(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GSHeading(
                  text: 'Set new password',
                ),
                GSText(
                  text:
                      'Almost done. Enter your new password and you are  all set.',
                ),
              ],
            ),
            const GSInput(
              size: GSInputSizes.$sm,
              variant: GSInputVariants.outline,
              cursorHeight: 12,
              constraints: BoxConstraints(
                maxWidth: 280,
                maxHeight: 40,
              ),
              // labelText: "New password",
              // labelStyle: TextStyle(fontSize: 12),
              // errorStyle: TextStyle(
              //   fontSize: 7,
              // ),
            ),
            const GSInput(
              size: GSInputSizes.$sm,
              variant: GSInputVariants.outline,
              cursorHeight: 12,
              constraints: BoxConstraints(
                maxWidth: 280,
                maxHeight: 40,
              ),
              // labelText: "Confirm new password",
              // labelStyle: TextStyle(fontSize: 12),
              // errorStyle: TextStyle(
              //   fontSize: 7,
              // ),
            ),
            GSBox(
              style: GlueStyle(
                width: double.maxFinite,
              ),
              child: GSButton(
                variant: GSButtonVariants.solid,
                action: GSButtonActions.primary,
                size: GSButtonSizes.$lg,
                child: const GSButtonText(
                  text: "Submit",
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
