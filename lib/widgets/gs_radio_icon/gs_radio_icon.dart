import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:provider/provider.dart';

class GSRadioIcon<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final void Function(T?)? onChanged;
  const GSRadioIcon(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final gsRadioProvider = GSRadioProvider.of(context);
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    return Radio<T>(value: value, groupValue: groupValue, onChanged: onChanged,);
  }
}
