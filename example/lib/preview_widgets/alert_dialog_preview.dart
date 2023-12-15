import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AlertDialogPreview extends StatelessWidget {
  const AlertDialogPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Alert Dialog',
      stories: [
        Story(
          name: 'Alert Dialog',
          description:
              'AlertDialog effectively interrupts a users flow and prompts them to take a specific action. Its commonly used for mandatory confirmations or call-to-actions.',
          builder: (context) => GSButton(
            size: GSSizes.$lg,
            child: const GSButtonText(text: "Click Me"),
            onPressed: () {
              GSAlertDialog.show(
                context,
                size: GSSizes.$md,
                content: GSAlertDialogContent(
                  header: GSAlertDialogHeader(
                    style: GSStyle(
                      bg: Colors.pink,
                    ),
                    child: const Text("Header"),
                  ),
                  body: const GSAlertDialogBody(
                    child: Text(
                        "Are you sure you want to deactivate your account? Your data will be permanently removed and cannot be undone."),
                  ),
                  footer: GSAlertDialogFooter(
                    child: GSButtonGroup(
                      buttons: [
                        GSButton(child: const Text("hey"), onPressed: () {}),
                        GSButton(child: const Text("click"), onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}