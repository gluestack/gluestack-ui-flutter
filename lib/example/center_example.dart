import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_center/gs_center.dart';

class CenterExample extends StatelessWidget {
  const CenterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const GSCenter(child: Text('GlueStack - Flutter UI')),
          GSCenter(
              height: 125,
              alignItems: GSAlignItems.start,
              justifyContent: GSJustifyContent.end,
              style: GSStyle(
                bg: Colors.pink,
                md: GSStyle(bg: Colors.yellow),
              ),
              child: const Text('Center Widget')),
        ],
      ),
    );
  }
}
