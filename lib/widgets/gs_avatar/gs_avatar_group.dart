import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_group_style.dart';

class GSAvatarGroup extends StatelessWidget {
  final List<GSAvatar> children;
  final GSStyle? style;
  final bool? reversed;
  final GSDirection? direction;

  const GSAvatarGroup({
    super.key,
    this.children = const <GSAvatar>[],
    this.style,
    this.reversed = false,
    this.direction = GSDirection.row,
  });

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      variantStyle: avatarGroupStyle,
      context,
      inlineStyle: style,
    )!;
    double overlap = styler.gap ?? 40;

    List<Widget> stackLayers = List<Widget>.generate(children.length, (index) {
      return Padding(
        padding: direction == GSDirection.column
            ? overlap.isNegative
                ? EdgeInsets.fromLTRB(0, 0, 0, index * overlap * -1)
                : EdgeInsets.fromLTRB(0, index * overlap, 0, 0)
            : overlap.isNegative
                ? EdgeInsets.fromLTRB(0, 0, index * overlap * -1, 0)
                : EdgeInsets.fromLTRB(index * overlap, 0, 0, 0),
        child:
            reversed! ? children[children.length - index - 1] : children[index],
      );
    });

    return Stack(
      alignment: AlignmentDirectional.center,
      children: stackLayers,
    );
  }
}
