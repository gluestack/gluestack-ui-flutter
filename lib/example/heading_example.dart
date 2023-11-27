import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:provider/provider.dart';

class HeadingExample extends StatelessWidget {
  const HeadingExample({super.key});

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
            GSHeading(
              text: 'I am a Heading',
              style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
            )
          ],
        ),
      ),
    );
  }
}
