import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSText(
              text: 'test 1',
              bold: true,
              underline: true,
              
              style: GSStyle(
                  textStyle:
                      const TextStyle(letterSpacing: $GSLetterSpacing.$lg)),
            )
          ],
        ),
      ),
    );
  }
}
