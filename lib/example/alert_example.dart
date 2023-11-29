import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/utils/base_layout.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_body.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_content.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_footer.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_header.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';
import 'package:provider/provider.dart';

class AlertExample extends StatelessWidget {
  const AlertExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: BaseLayout(
        code: code,
        component: Center(
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
      ),
    );
  }
}
