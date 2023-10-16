import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_token.dart';

class GSRadio<T> extends StatelessWidget {
  final GSRadioSize size;
  final Widget icon;
  final bool isEnabled;
  final Widget? label;

  const GSRadio(
      {super.key,
      this.size = GSRadioSize.md,
      required this.icon,
      this.label,
      this.isEnabled = false});

  @override
  Widget build(BuildContext context) {
    return GSRadioProvider(
        isEnabled: isEnabled,
        size: size,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, if (label != null) label!],
        ));
  }
}
