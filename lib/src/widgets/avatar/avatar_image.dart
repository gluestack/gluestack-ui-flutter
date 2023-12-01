import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

class AvatarImage extends StatelessWidget {
  final String imageUrl;
  final GSStyle? style;

  const AvatarImage(
      {super.key, required this.imageUrl, this.style,});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
