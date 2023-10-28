import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_style.dart';

class GSRadio<T> extends StatelessWidget {
  final GSSizes? size;
  final Widget icon;
  final Widget? label;
  final T value;
  final T groupValue;

  const GSRadio({super.key, required this.icon,required this.groupValue,required this.value ,this.label, this.size});

  @override
  Widget build(BuildContext context) {
    final radioSize = size ?? radioStyle.props!.size!;

    return GSRadioProvider<T>(
        value: value,
        groupValue: groupValue,
        size: radioSize,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, if (label != null) label!],
        ));
  }
}
