import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';

class AlertExample extends StatelessWidget {
  const AlertExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''GSButton(
          size: GSSizes.\$lg,
          child: const GSButtonText(text: "Click Me"),
          onPressed: () {
            GSAlertDialog.show(
              context,
              size: GSSizes.\$full,
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
              )
''';
    return Scaffold(
      appBar: AppBar(
        title: const GSText(
          text: "Alert",
        ),
      ),
      body: BaseLayout(
        code: code,
        component: GSCenter(
          child: GSButton(
            size: GSSizes.$lg,
            child: const GSButtonText(text: "Click Me"),
            onPressed: () {
              GSAlertDialog.show(
                context,
                size: GSSizes.$full,
                content: GSAlertDialogContent(
                  header: GSAlertDialogHeader(
                    style: GSStyle(
                      bg: $GSColors.blue400,
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
                          child: const GSText(
                            text: "hey",
                          ),
                          onPressed: () {},
                        ),
                        GSButton(
                          child: const GSText(
                            text: "click",
                          ),
                          onPressed: () {},
                        ),
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
