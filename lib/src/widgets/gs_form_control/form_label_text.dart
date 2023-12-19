import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control_label_text.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';

class GSFormLabelText extends StatelessWidget {
  final String text;
  final GSStyle? style;
  final bool? isRequired;
  const GSFormLabelText(this.text, {super.key, this.style, this.isRequired});

  @override
  Widget build(BuildContext context) {
    final isLabelRequired =
        isRequired ?? GSFormProvider.of(context)?.isRequired ?? false;
    final size = GSFormProvider.of(context)?.size;
    return isLabelRequired
        ? GSHStack(
            mainAxisSize: MainAxisSize.min,
            children: [
              GSText(
                text: text,
                size: size,
                style: GSStyle.fromMap(data: formControlLabelTextData)
                    .merge(style),
              ),
              const SizedBox(width: 2),
              GSText(
                text: '*',
                size: size,
                style: GSStyle(textStyle: const TextStyle(color: Colors.red)),
              )
            ],
          )
        : GSText(
            text: text,
            style: GSStyle.fromMap(data: formControlLabelTextData).merge(style),
          );
  }
}
