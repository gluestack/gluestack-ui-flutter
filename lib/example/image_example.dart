import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';

import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSImage(
               size: GSSizes.$2xl,
                path:
                    'https://plus.unsplash.com/premium_photo-1697211174198-18da849f87c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5OTI2NTM4Mg&ixlib=rb-4.0.3&q=80&w=1080',
                imageType: GSImageType.network)
          ],
        ),
      ),
    );
  }
}
