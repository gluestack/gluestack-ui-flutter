import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

class GSAvatarImage extends StatelessWidget {
  final String imageUrl;
  final GSStyle? style;

  const GSAvatarImage({
    super.key,
    required this.imageUrl,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
