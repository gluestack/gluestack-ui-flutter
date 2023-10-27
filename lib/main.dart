import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/styled_button/styled_button.dart';
import 'package:gluestack_flutter_pro/widgets/styled_text/styled_text.dart';

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
              StyledButton(
                onPressed: () {},
                child: StyledText(
                  text: "Primary w solid",
                  fontSize: 'lg',
                  color: 'white',
                ),
                size: "md",
                variant: "solid",
                action: "primary",
              ),
              StyledButton(
                onPressed: () {},
                child: StyledText(
                  text: "Primary w outline",
                  fontSize: 'sm',
                  color: 'primary500',
                ),
                size: "lg",
                variant: "outline",
                action: "primary",
              ),
              StyledButton(
                onPressed: () {},
                child: StyledText(
                  text: "Primary w link",
                  fontSize: 'md',
                  color: 'primary500',
                ),
                size: "md",
                variant: "link",
                action: "primary",
              ),
              StyledButton(
                onPressed: () {},
                child: StyledText(
                    text: "Positive w solid",
                    fontSize: 'lg',
                    color: 'white',
                    letterSpacing: '2xl'),
                size: "md",
                variant: "solid",
                action: "positive",
              ),
              StyledButton(
                onPressed: () {},
                child: StyledText(
                  text: "Primary w solid",
                  fontSize: 'md',
                  color: 'rose500',
                ),
                size: "md",
                variant: "outline",
                action: "negative",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
