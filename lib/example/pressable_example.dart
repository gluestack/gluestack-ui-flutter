import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:provider/provider.dart';

class PressableExample extends StatelessWidget {
  const PressableExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSPressable(
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
            )
          ],
        ),
      ),
    );
  }
}
