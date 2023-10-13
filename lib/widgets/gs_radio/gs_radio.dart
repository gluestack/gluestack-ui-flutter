import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio_icon/gs_radio_icon.dart';

class GSRadio<T> extends StatelessWidget {
  final GSRadioSize size;
  final GSRadioIcon icon;

  const GSRadio({
    super.key,
    this.size = GSRadioSize.md,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GSRadioProvider(
        size: size,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon],
        ));
  }
}
