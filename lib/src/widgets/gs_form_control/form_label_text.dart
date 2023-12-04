import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control_label_text.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';

class GSFormLabelText extends StatelessWidget {
  final String text;
  final GSStyle? style;
  const GSFormLabelText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final isRequired = GSFormProvider.of(context)?.isRequired ?? false;
    return isRequired
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GSText(
                text: text,
                style: GSStyle.fromMap(data: formControlLabelTextData)
                    .merge(style),
              ),
              const SizedBox(width: 2),
              GSText(
                text: '*',
                style: GSStyle(textStyle: TextStyle(color: Colors.red)),
              )
            ],
          )
        : GSText(
            text: text,
            style: GSStyle.fromMap(data: formControlLabelTextData).merge(style),
          );
  }
}
