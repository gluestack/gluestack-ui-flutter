
import 'package:flutter/material.dart' hide AlertDialog,Center;
import 'package:gluestack_ui/gluestack_ui.dart' ;
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
      appBar: AppBar(),
      body: BaseLayout(
        code: code,
        component: Center(
          child: Button(
            size: GSSizes.$lg,
            child: const ButtonText(text: "Click Me"),
            onPressed: () {
              AlertDialog.show(
                context,
                size: GSSizes.$full,
                content: AlertDialogContent(
                  header: AlertDialogHeader(
                    style: GSStyle(
                      bg: Colors.pink,
                    ),
                    child: const Text("Header"),
                  ),
                  body: const AlertDialogBody(
                    child: Text(
                        "Are you sure you want to deactivate your account? Your data will be permanently removed and cannot be undone."),
                  ),
                  footer: AlertDialogFooter(
                    child: ButtonGroup(
                      buttons: [
                        Button(child: const Text("hey"), onPressed: () {}),
                        Button(child: const Text("click"), onPressed: () {}),
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
