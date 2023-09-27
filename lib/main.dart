import 'package:flutter/material.dart';
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
                variant: GSButtonVariant.outline,
                action: GSButtonAction.positive,
                onPressed: () => {},
                style: const StyleData(
                  color: Colors.amber,
                  borderWidth: 4,
                  borderColor: Colors.black,
                ),
                child: const GSButtonText(
                  text: "Click here",
                  style: StyleData(textStyle: TextStyle(color: Colors.pink)),
                ),
              ),
              const GSContainer(
                style: StyleData(
                  color: Colors.red,
                  width: 120,
                  height: 150,
                ),
                child: Text("I am a container"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
