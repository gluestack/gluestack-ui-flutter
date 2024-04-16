import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSAlertDialogSizes.$xs.name),
  Option<int>(value: 1, label: GSAlertDialogSizes.$sm.name),
  Option<int>(value: 2, label: GSAlertDialogSizes.$md.name),
  Option<int>(value: 3, label: GSAlertDialogSizes.$lg.name),
  Option<int>(value: 4, label: GSAlertDialogSizes.$full.name),
];

final class AlertDialogStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSButton(
        size: GSButtonSizes.$lg,
        child: const GSButtonText(text: "Click Me"),
        onPressed: () {
          GSAlertDialog.show(
            context,
            size: GSAlertDialogSizes.$full,
            content: GSAlertDialogContent(
              header: GSAlertDialogHeader(
                style: GlueStyle(
                  bg: Colors.pink,
                ),
                child: const GSText(
                  text: "Header",
                ),
              ),
              body: const GSAlertDialogBody(
                child: GSText(
                  text:
                      "Are you sure you want to deactivate your account? Your data will be permanently removed and cannot be undone.",
                ),
              ),
              footer: GSAlertDialogFooter(
                child: GSButtonGroup(
                  buttons: [
                    GSButton(
                        action: GSButtonActions.positive,
                        variant: GSButtonVariants.outline,
                        child: const GSText(
                          text: "Yes",
                        ),
                        onPressed: () {}),
                    GSButton(
                        action: GSButtonActions.negative,
                        variant: GSButtonVariants.outline,
                        child: const GSText(
                          text: "No",
                        ),
                        onPressed: () {}),
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
