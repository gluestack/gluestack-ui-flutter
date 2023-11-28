import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/utils/base_layout.dart';
import 'package:gluestack_flutter_pro/widgets/gs_center/gs_center.dart';
import 'package:provider/provider.dart';

class CenterExample extends StatelessWidget {
  const CenterExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var code = '''GSCenter(
          style: GSStyle(
            alignItems: GSAlignments.end,
            justifyContent: GSAlignments.start,
            height: 150,
            bg: Colors.pink,
            md: GSStyle(bg: Colors.yellow),
          ),
          child: const GSCenter(child: Text('Testing Center Widget')),
        )
  ''';
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: BaseLayout(
        code: code,
        component: GSCenter(
          style: GSStyle(
            alignItems: GSAlignments.end,
            justifyContent: GSAlignments.start,
            height: 150,
            bg: Colors.pink,
            md: GSStyle(bg: Colors.yellow),
          ),
          child: const GSCenter(child: Text('Testing Center Widget')),
        ),
      ),
    );
  }
}
