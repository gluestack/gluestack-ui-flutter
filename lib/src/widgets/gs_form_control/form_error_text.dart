import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control_error_text.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';

class GSFormErrorText extends StatelessWidget {
  final String text;
  final GSStyle? style;
  const GSFormErrorText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final size = GSFormProvider.of(context)?.size;

    return GSText(
      text: text,
      size: size,
      style: GSStyle.fromMap(data: formControlErrorTextData).merge(style),
    );
  }
}
