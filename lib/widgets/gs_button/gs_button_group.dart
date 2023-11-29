import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/button_styles_generated.dart';
class GSButtonGroup extends StatelessWidget {
  final List<GSButton>? buttons;
  final GSDirection? direction;
  final GSSizes? size;
  final GSSpaces? space;
  final bool? isDisabled;
  final bool? reversed;
  final bool? isAttached;
  final GSStyle? style;

  const GSButtonGroup({
    super.key,
    this.buttons = const [],
    this.direction = GSDirection.row,
    this.isDisabled = false,
    this.reversed = false,
    this.isAttached = false,
    this.size,
    this.space,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final buttonList = reversed! ? buttons!.reversed : buttons!;
    final buttonGroupSize = size ?? buttonGroupStyle.props?.size;
    final buttonGroupSpace = space ?? buttonGroupStyle.props?.space;
    GSStyle styler = resolveStyles(
      variantStyle: buttonGroupStyle,
      context,
      inlineStyle: style,
    )!;
    List<Widget> spacedButtonList = [];

    for (var button in buttonList) {
      // Add the button to the list
      spacedButtonList.add(button);

      // Add space after the button
      if (buttonList.last != button) {
        // Add a SizedBox with the desired space
        if (direction == GSDirection.column) {
          // Vertical spacing
          spacedButtonList.add(SizedBox(
              height: GSButtonGroupStyle.space[buttonGroupSpace]?.gap));
        } else {
          // Horizontal spacing
          spacedButtonList.add(
              SizedBox(width: GSButtonGroupStyle.space[buttonGroupSpace]?.gap));
        }
      }
    }

    return GSButtonGroupProvider(
      isDisabled: isDisabled!,
      size: buttonGroupSize!,
      isAttached: isAttached!,
      child: Container(
        color: styler.bg,
        height: styler.height,
        width: styler.width,
        child: Flex(
          direction:
              direction == GSDirection.column ? Axis.vertical : Axis.horizontal,
          children:
              isAttached! ? buttonList.toList() : spacedButtonList.toList(),
        ),
      ),
    );
  }
}
