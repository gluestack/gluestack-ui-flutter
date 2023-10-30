import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';

import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio_icon/gs_radio_icon_style.dart';

class GSRadioIcon<T> extends StatelessWidget {
  const GSRadioIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);

    final bool isChecked = value!.value == value.groupValue;
    GSStyle styler = resolveStyles(
      variantStyle: radioIconStyle.merge(radioIndicatorStyle),
      context,
      inlineStyle: value.style,
    )!;

    final hoverColor = isChecked ? styler.checked?.onHover?.color : null;

    final currentColor = value.isInvalid
        ? styler.onInvaild?.borderColor
        : value.isHovered
            ? hoverColor
            : isChecked
                ? styler.checked?.color
                : null;
    return Opacity(
      opacity: value.isDisabled ? styler.onDisabled!.opacity! : 1,
      child: Radio(
          mouseCursor: value.isDisabled?SystemMouseCursors.forbidden:null,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor:
              MaterialStateProperty.resolveWith((states) => currentColor),
          splashRadius: 0.0,
          value: value.value,
          groupValue: value.groupValue,
          onChanged: value.isDisabled ? null : value.onChanged),
    );
  }
}
