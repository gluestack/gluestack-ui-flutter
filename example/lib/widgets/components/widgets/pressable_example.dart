import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class PressableExample extends StatelessWidget {
  const PressableExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
            GSPressable(
                hitSlop: 10,
                style: GlueStyle(
                  bg: Colors.yellow,
                  onHover: GlueStyle(bg: Colors.green),
                  onFocus: GlueStyle(borderColor: Colors.red, borderWidth: 10),
                ),
                onPress: () {
                  print('Pressed!');
                },
                onLongPress: () {
                  print('Long Pressed!');

                },
                child: GSText(
                  text: 'Press Me',
                  underline: true,
                  style: GlueStyle(
                      color: Colors.blue,
                      textStyle:
                          const TextStyle(letterSpacing: \$GSLetterSpacing.\$lg)),
                ),
             )
  ''';
    return CustomGSLayout(
      title: "Pressable",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
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
            // print('Pressed!');
          },
          onLongPress: () {
            // print('Long Pressed!');
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
