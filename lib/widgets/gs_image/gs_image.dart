import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image_style.dart';

enum GSImageType {
  network,
  file,
  asset,
}

class GSImage extends StatelessWidget {
  final String path;
  final GSImageType imageType;
  final GSStyle? style;
  final GSSizes? size;
  const GSImage(
      {super.key,
      required this.path,
      required this.imageType,
      this.style,
      this.size});

  @override
  Widget build(BuildContext context) {
    final imageSize = size ?? imageStyle.props!.size;

    final GSStyle styler = resolveStyles(
      context,
      size: GSImageStyle.size[imageSize],
      inlineStyle: style,
    )!;

    print(styler.width);
    switch (imageType) {
      case GSImageType.network:
        return Image.network(
          height: styler.height,
          width: styler.width,
          path,
        );
      case GSImageType.file:
        return Image.file(
          File(path),
          height: styler.height,
          width: styler.width,
        );
      case GSImageType.asset:
        return Image.asset(
          height: styler.height,
          width: styler.width,
          path,
        );
    }
  }
}
