import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';

class PressableExample extends StatelessWidget {
  const PressableExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
            GSPressable(
                hitSlop: 10,
                style: GSStyle(
                  bg: Colors.yellow,
                  onHover: GSStyle(bg: Colors.green),
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
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Pressable",
          size: GSSizes.$xl,
        ),
      ),
      body: BaseLayout(
        code: code,
        component: GSPressable(
          hitSlop: 10,
          style: GSStyle(
            bg: Colors.yellow,
            onHover: GSStyle(bg: Colors.green),
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
                textStyle: TextStyle(letterSpacing: $GSLetterSpacing.$lg)),
          ),
        ),
      ),
    );
  }
}
