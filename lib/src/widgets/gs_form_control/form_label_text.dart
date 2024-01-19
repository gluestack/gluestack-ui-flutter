import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/form_label_text_style.dart';
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
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GSText(
                text: text,
                size: size,
                style: formLabelTextStyle.merge(style),
              ),
              const SizedBox(width: 2),
              GSText(
                text: '*',
                size: size,
                style: GSStyle(
                    textStyle: const TextStyle(color: Color(0xFFFF0000))),
              )
            ],
          )
        : GSText(
            text: text,
            style: formLabelTextStyle.merge(style),
          );
  }
}
