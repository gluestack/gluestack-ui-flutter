import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_style.dart';

class GSRadio<T> extends StatelessWidget {
  final GSRadioSize? size;
  final Widget icon;
  final Widget? label;
  const GSRadio(
      {super.key, required this.icon, this.label, this.size = GSRadioSize.md});

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      size: GSRadioStyle.gsRadioStyle[size],
    )!;
    return GSRadioProvider(
        size: size!,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, if (label != null) label!],
        ));
  }
}
