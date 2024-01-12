import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class AlertDialogStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
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
    );
  }

  @override
  String get routePath => "alert-dialog-preview";

  @override
  String get storyName => "Alert Dialog";
}
