import 'package:flutter/material.dart';

class GSRespScaler extends StatelessWidget {
  final Widget child;
  final double ogDesignWidth;

  const GSRespScaler({
    super.key,
    required this.child,
    this.ogDesignWidth = 375, //generic figma width
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double scaleFactor = screenWidth / ogDesignWidth;

        return Transform.scale(
          scale: scaleFactor < 1 ? 1 : scaleFactor,
          alignment: Alignment.topLeft,
          child: child,
        );
      },
    );
  }
}
