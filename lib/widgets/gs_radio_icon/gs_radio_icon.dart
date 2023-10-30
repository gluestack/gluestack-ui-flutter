import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio_icon/gs_radio_icon_style.dart';
import 'package:provider/provider.dart';

class GSRadioIcon<T> extends StatelessWidget {
  const GSRadioIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);
    final theme = Provider.of<ThemeProvider>(context);
       final bool isChecked = value!.value == value.groupValue;
      final hoverColor = theme.currentTheme == GSThemeMode.light
        ? isChecked
            ? radioIconStyle.onHover?.checked?.color
            : radioIconStyle.onHover?.color
        : isChecked
            ? radioIconStyle.dark?.onHover?.checked?.color
            : radioIconStyle.dark?.onHover?.color;

    return Radio(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return hoverColor;
          }
          return isChecked? radioIconStyle.checked!.color:null;
        }),
        value: value.value,
        groupValue: value.groupValue,
        onChanged: value.onChanged);
  }
}
