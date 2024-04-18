import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_group_style.dart';

class GSButtonGroup extends StatelessWidget {
  final List<GSButton>? buttons;
  final GSDirection? direction;
  final GSButtonGroupSizes? size;
  final GSButtonGroupSpaces? space;
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
    final buttonGroupSize = size?.toGSSize ?? buttonGroupStyle.props?.size;
    final buttonGroupSpace = space?.toGSSpaces ?? buttonGroupStyle.props?.space;
    GSConfigStyle styler = resolveStyles(
      styles: [
        buttonGroupStyle,
        buttonGroupStyle.sizeMap(buttonGroupSize),
        buttonGroupStyle.spaceMap(buttonGroupSpace),
      ],
      context: context,
      inlineStyle: style,
    );
    List<Widget> spacedButtonList = [];

    for (var button in buttonList) {
      // Add the button to the list
      spacedButtonList.add(button);

      // Add space after the button
      if (buttonList.last != button) {
        // Add a SizedBox with the desired space
        if (direction == GSDirection.column) {
          // Vertical spacing
          spacedButtonList.add(
            SizedBox(height: styler.gap),
          );
        } else {
          // Horizontal spacing
          spacedButtonList.add(
            SizedBox(width: styler.gap),
          );
        }
      }
    }

    return GSButtonGroupProvider(
      isDisabled: isDisabled!,
      size: buttonGroupSize?.toGSSize ?? buttonGroupStyle.props!.size!,
      isAttached: isAttached!,
      child: Container(
        color: styler.bg?.getColor(context),
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
