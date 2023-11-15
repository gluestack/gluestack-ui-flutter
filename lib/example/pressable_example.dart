import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';

class PressableExample extends StatelessWidget {
  const PressableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSPressable(
              style: GSStyle(
                  onHover: GSStyle(color: Colors.green, bg: Colors.red)),
              onPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Button Pressed!')));
              },
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Long Pressed Triggered!')));
              },
              child: GSText(
                text: 'Press Me',
                underline: true,
                style: GSStyle(
                    color: Colors.blue,
                    textStyle:
                        const TextStyle(letterSpacing: $GSLetterSpacing.$lg)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
