import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_center/gs_center.dart';
import 'package:provider/provider.dart';

class CenterExample extends StatelessWidget {
  const CenterExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Column(
        children: [
          const GSCenter(child: Text('GlueStack - Flutter UI')),
          GSCenter(
              style: GSStyle(
                alignItems: GSAlignments.end,
                justifyContent: GSAlignments.start,
                height: 150,
                bg: Colors.pink,
                md: GSStyle(bg: Colors.yellow),
              ),
              child: const Text('Testing Center Widget')),
        ],
      ),
    );
  }
}
