import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast_description.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast_title.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/show_toast.dart';

class ToastExample extends StatelessWidget {
  const ToastExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GSButton(
          size: GSSizes.$lg,
          child: const GSButtonText(text: "Click Me"),
          onPressed: () {
            showToast(
              context,
              child: const GSToast(
                variant: GSVariants.accent,
                action: GSActions.warning,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GSToastTitle(
                      title: "Hey",
                    ),
                    GSToastDescription(
                      description: "Desc Desc Desc Desc Desc Desc ",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
