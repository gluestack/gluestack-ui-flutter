import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_divider/gs_divider.dart';
import 'package:provider/provider.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            GSDivider(
              orientation: GSOrientations.vertical,
              style: GSStyle(bg: Colors.black, height: 30),
            ),
            GSDivider(
              style: GSStyle(
                bg: Colors.blue,
              ),
            ),
            GSDivider(
              orientation: GSOrientations.vertical,
              style: GSStyle(
                bg: Colors.red,
              ),
            ),
            GSDivider(
              style: GSStyle(
                bg: Colors.orange,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Text('GS Divider'),
            ),
            GSDivider(
              style: GSStyle(
                bg: Colors.purple,
              ),
            ),
            GSDivider(
              orientation: GSOrientations.vertical,
              style: GSStyle(
                bg: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
