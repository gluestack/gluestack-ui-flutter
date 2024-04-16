import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';

import '../layout/custom_gs_layout.dart';

class AlertExample extends StatelessWidget {
  const AlertExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSButton(
            size: GSButtonSizes.\$lg,
            child: const GSButtonText(text: "Click Me"),
            onPressed: () {
              GSAlertDialog.show(
                context,
                size: GSAlertDialogSizes.\$full,
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
          )
''';
    return CustomGSLayout(
      title: "Alert",
      style: GlueStyle(
        dark: GlueStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: Center(
          child: GSButton(
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
        ),
      ),
    );
  }
}
