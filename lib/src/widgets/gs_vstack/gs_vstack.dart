import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_vstack/gs_vstack_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSVstackSpaces { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $4xl }

class GSVStack extends StatelessWidget {
  final List<Widget> children;
  final GSVstackSpaces? space;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final bool isReversed;
  final VerticalDirection verticalDirection;
  const GSVStack({
    super.key,
    this.space = GSVstackSpaces.$none,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.isReversed = false,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> spacedChildrenList = [];
    final vStackSpace = space?.toGSSpaces;

    for (var child in children) {
      spacedChildrenList.add(child);
      if (child != children.last) {
        spacedChildrenList.add(
          SizedBox(
              height: vStackSpace == GSSpaces.$none
                  ? null
                  : vstackStyle.spaceMap(vStackSpace)?.gap),
        );
      }
    }
    return Column(
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
