import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button_text/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_container/gs_container.dart';
import 'package:gluestack_flutter_pro/widgets/gs_container/gs_container_extension.dart';

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
                child: const GSButtonText(
                  text: "Click here",
                ),
                onPressed: () => {},
              ),
              const GSContainer(child: Text("HEYYYY")).style(
                color: Colors.red,
                width: 200,
                height: 200,
                borderRadius: 8,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                borderColor: Colors.black,
                borderWidth: 4,
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        ),
      ),
    );
  }
}
