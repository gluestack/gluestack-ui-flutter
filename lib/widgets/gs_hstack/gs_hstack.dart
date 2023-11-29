import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack_style.dart';

class GSHStack extends StatelessWidget {
  final List<Widget> children;
  final GSSpaces? space;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final bool isReversed;
  final VerticalDirection verticalDirection;
  const GSHStack({
    super.key,
    this.space = GSSpaces.$none,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.isReversed = false,
    this.children = const [],
  }) : assert(
            space == GSSpaces.$none ||
                space == GSSpaces.$xs ||
                space == GSSpaces.$sm ||
                space == GSSpaces.$md ||
                space == GSSpaces.$lg ||
                space == GSSpaces.$xl ||
                space == GSSpaces.$2xl ||
                space == GSSpaces.$3xl ||
                space == GSSpaces.$4xl ||
                space == GSSpaces.$none ||
                space == null,
            "only support for spaces of xs, sm, md, lg, xl , 2xl, 3xl and 4xl");

  @override
  Widget build(BuildContext context) {
    List<Widget> spacedChildrenList = [];

    for (var child in children) {
      spacedChildrenList.add(child);
      if (child != children.last) {
        spacedChildrenList.add(
          SizedBox(
              width: space == GSSpaces.$none
                  ? null
                  : GSHStackStyle.space[space]?.gap),
        );
      }
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: isReversed
          ? spacedChildrenList.reversed.toList()
          : spacedChildrenList,
    );
  }
}
