import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button_text/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_container/gs_container.dart';
import 'package:gluestack_flutter_pro/widgets/style/style_data.dart';

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
                size: GSButtonSize.md,
                variant: GSButtonVariant.solid,
                action: GSButtonAction.primary,
                onPressed: () => {},
                // style: StyleData(
                //   color: color("blueGray700"),
                // ),
                child: const GSButtonText(
                  text: "Click here",
                ),
              ),
              GSBox(
                style: StyleData(
                  color: color('primary500'),
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.symmetric(
                    vertical: space("5"),
                    horizontal: space("5"),
                  ),
                ),
                child: Text("I am a container",
                    style: TextStyle(color: color("white"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
