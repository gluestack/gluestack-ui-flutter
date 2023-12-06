import 'package:flutter/material.dart';

class ResponsiveRowColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;
  final Axis? direction;
  final EdgeInsets? seperatorPadding;
  final double? sw;

  const ResponsiveRowColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.direction,
    this.seperatorPadding,
    this.sw = 850,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isSmallScreen = width < sw!;
    return Flex(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.stretch : crossAxisAlignment,
      clipBehavior: clipBehavior,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      direction: direction ?? (isSmallScreen ? Axis.vertical : Axis.horizontal),
      children: children.map((e) {
        return !isSmallScreen
            ? Expanded(
                child: Padding(
                    padding:
                        seperatorPadding ?? EdgeInsets.symmetric(horizontal: 4),
                    child: e),
              )
            : Padding(
                padding: seperatorPadding ?? EdgeInsets.symmetric(vertical: 4),
                child: e);
      }).toList(),
    );
  }
}
