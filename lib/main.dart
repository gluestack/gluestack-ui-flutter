import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
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
                style: const StyleData(
                  color: $GSColors.rose500,
                  padding: EdgeInsets.symmetric(
                    vertical: $GSSpace.$5,
                    horizontal: $GSSpace.$3,
                  ),
                ),
                child: const GSButtonText(
                  text: "Click here",
                ),
              ),
              const GSBox(
                style: StyleData(
                  color: $GSColors.purple400,
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.symmetric(
                    vertical: $GSSpace.$5,
                    horizontal: $GSSpace.$5,
                  ),
                  borderRadius: $GSRadii.$sm,
                ),
                child: Text(
                  "I am a container",
                  style: TextStyle(
                    color: $GSColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
