import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control_helper_text.dart';

class GSFormHelperText extends StatelessWidget {
  final String text;
  final GSStyle? style;
  const GSFormHelperText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return GSText(
      text: text,
      style: GSStyle.fromMap(data: formControlHelperTextData).merge(style),
    );
  }
}
