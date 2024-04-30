import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_radio/gs_radio_icon_style.dart';

import 'package:gluestack_ui/src/widgets/gs_radio/gs_radio_raw.dart';

class GSRadioIcon<T> extends StatelessWidget {
  final Color? activeColor;
  final bool autofocus;
  final GSSizes? size;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? hoverColor;
  final bool toggleable;
  const GSRadioIcon({
    super.key,
    this.activeColor,
    this.autofocus = false,
    this.focusColor,
    this.focusNode,
    this.hoverColor,
    this.size,
    this.toggleable = false,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final bool isChecked = value!.value == value.groupValue;
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsRadioIconConfig.ancestorStyle.first];
    final radioSize = radioIconStyle.sizeMap(size ?? value.size);

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [radioIconStyle.merge(radioIndicatorStyle)],
      inlineStyle: value.style,
    );

    return Opacity(
      opacity: value.isDisabled ? styler.onDisabled!.opacity! : 1,
      child: Container(
        height: radioSize?.height,
        width: radioSize?.width,
        margin: styler.margin,
        child: MouseRegion(
          cursor: value.isDisabled
              ? SystemMouseCursors.forbidden
              : SystemMouseCursors.click,
          child: GSRawRadio(
              activeColor: activeColor,
              autofocus: autofocus,
              focusColor: focusColor,
              focusNode: focusNode,
              toggleable: toggleable,
              fillColor: value.isInvalid
                  ? styler.onInvalid!.borderColor!.getColor(context)
                  : isHovered
                      ? isChecked
                          ? styler.checked!.onHover!.color!.getColor(context)
                          : styler.onHover!.borderColor!.getColor(context)
                      : isChecked
                          ? styler.checked!.color!.getColor(context)
                          : styler.borderColor!.getColor(context),
              value: value.value,
              groupValue: value.groupValue,
              onChanged: value.onChanged),
        ),
      ),
    );
  }
}
