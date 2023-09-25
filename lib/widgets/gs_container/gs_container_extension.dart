import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_container/gs_container.dart';

extension GSContainerExtension on Widget {
  GSContainer styled({
    Color color = Colors.transparent,
    Color borderColor = Colors.transparent,
    double borderRadius = 0,
    double width = 0,
    double height = 0,
    double borderWidth = 0,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    EdgeInsetsGeometry margin =
        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return GSContainer(
      child: Container(
        alignment: alignment,
        padding: padding,
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: this,
      ),
    );
  }
}
