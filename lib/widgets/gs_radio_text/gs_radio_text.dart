import 'package:flutter/material.dart';

import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';

import 'package:gluestack_flutter_pro/widgets/gs_radio_text/gs_radio_text_style.dart';
import 'package:provider/provider.dart';

class GSRadioText<T> extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? hoverColor;
  const GSRadioText(
      {super.key, required this.text, this.textStyle, this.hoverColor});

  @override
  State<GSRadioText> createState() => _GSRadioTextState<T>();
}

class _GSRadioTextState<T> extends State<GSRadioText<T>> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);
    final bool isChecked = value!.value == value.groupValue;

    final fontSize = GSRadioTextStyle.labelSize[value.size];
    final theme = Provider.of<ThemeProvider>(context);

    final fontColor = theme.currentTheme == GSThemeMode.light
        ? isChecked
            ? radioLabelStyle.checked?.color
            : radioLabelStyle.color
        : isChecked
            ? radioLabelStyle.dark?.checked?.color
            : radioLabelStyle.dark?.color;

    final hoverColor = theme.currentTheme == GSThemeMode.light
        ? isChecked
            ? radioLabelStyle.onHover?.checked?.color
            : radioLabelStyle.onHover?.color
        : isChecked
            ? radioLabelStyle.dark?.onHover?.checked?.color
            : radioLabelStyle.dark?.onHover?.color;

    final currentTextStyle = TextStyle(
      fontSize: widget.textStyle?.fontSize ?? fontSize,
      color: isHovering
          ? widget.hoverColor ?? hoverColor
          : widget.textStyle?.color ?? fontColor,
    );



    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (value) {
        if (value != isHovering) {
          setState(() {
            isHovering = value;
          });
        }
      },
      child: Text(
        widget.text,
        style: currentTextStyle,
      ),
    );
  }
}
