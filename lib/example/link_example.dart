import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';

import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link.dart';
import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link_text.dart';
import 'package:provider/provider.dart';

class LinkExample extends StatelessWidget {
  const LinkExample({super.key});

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
            GSLink(
                style: GSStyle(),
                url: 'https://gluestack.io/',
                text: const GSLinkText(text: 'gluestack')),
          ],
        ),
      ),
    );
  }
}
