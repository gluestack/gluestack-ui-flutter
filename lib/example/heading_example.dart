import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';

class HeadingExample extends StatelessWidget {
  const HeadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSHeading(
              text: 'I am a Heading',
              bold: true,
              highlight: true,
              isTruncated: true,
              italic: true,
              strikeThrough: true,
              underline: true,
              sub: true,
              style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
            )
          ],
        ),
      ),
    );
  }
}
