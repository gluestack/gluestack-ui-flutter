import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';

class PressableExample extends StatelessWidget {
  const PressableExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''GSPressable(
              hitSlop: 10,
              style: GSStyle(
                bg: Colors.yellow,
                highlightColor: Colors.blue,
                splashColor: Colors.red,
                onHover: GSStyle(color: Colors.green),
                onFocus: GSStyle(borderColor: Colors.red, borderWidth: 10),
              ),
              onPress: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Button Pressed!'),
                  duration: Duration(milliseconds: 300),
                ));
              },
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Long Pressed Triggered!'),
                  duration: Duration(milliseconds: 300),
                ));
              },
              child: GSText(
                text: 'Press Me',
                underline: true,
                style: GSStyle(
                    color: Colors.blue,
                    textStyle:
                        const TextStyle(letterSpacing: \$GSLetterSpacing.\$lg)),
              ),
            )
  ''';
    return Scaffold(
      appBar: AppBar(),
      body: BaseLayout(
        code: code,
        component: Pressable(
          hitSlop: 10,
          style: GSStyle(
            bg: Colors.yellow,
            highlightColor: Colors.blue,
            splashColor: Colors.red,
            onHover: GSStyle(color: Colors.green),
            onFocus: GSStyle(borderColor: Colors.red, borderWidth: 10),
          ),
          onPress: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Button Pressed!'),
              duration: Duration(milliseconds: 300),
            ));
          },
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Long Pressed Triggered!'),
              duration: Duration(milliseconds: 300),
            ));
          },
          child: GSText(
            text: 'Press Me',
            underline: true,
            style: GSStyle(
                color: Colors.blue,
                textStyle:
                    const TextStyle(letterSpacing: $GSLetterSpacing.$lg)),
          ),
        ),
      ),
    );
  }
}
