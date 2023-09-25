import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button_text/gs_button_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GSButton(
                size: GSButtonSize.lg,
                variant: GSButtonVariant.outline,
                action: GSButtonAction.positive,
                child: const GSButtonText(
                  text: "Click here",
                ),
                onPressed: () => {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
