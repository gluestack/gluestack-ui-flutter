import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_hstack/gs_hstack_style.dart';

enum GSHstackSpaces { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $4xl }

///
/// Gluestack HStack.
///
class GSHStack extends StatelessWidget {
  final GSHstackSpaces? space;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final bool isReversed;
  final VerticalDirection verticalDirection;
  const GSHStack({
    super.key,
    this.space = GSHstackSpaces.$none,
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
    final hStackSpace = space?.toGSSpaces;

    for (var child in children) {
      spacedChildrenList.add(child);
      if (child != children.last) {
        spacedChildrenList.add(
          SizedBox(
              width: hStackSpace == GSSpaces.$none
                  ? null
                  : hstackStyle.spaceMap(hStackSpace)?.gap),
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
