import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_body.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_content.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_footer.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_header.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';

class AlertExample extends StatelessWidget {
  const AlertExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GSButton(
          size: GSSizes.$lg,
          child: const GSButtonText(text: "Click Me"),
          onPressed: () {
            GSAlertDialog.show(
              context,
              size: GSSizes.$lg,
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
                  // style: GSStyle(
                  //   bg: Colors.blue,
                  // ),
                ),
                footer: GSAlertDialogFooter(
                  child: GSButtonGroup(
                    buttons: [
                      GSButton(child: const Text("hey"), onPressed: () {}),
                      GSButton(child: const Text("click"), onPressed: () {}),
                    ],
                  ),
                  // style: GSStyle(
                  //   bg: Colors.yellow,
                  // ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
