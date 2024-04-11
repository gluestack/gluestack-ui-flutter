import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/form_error_text_style.dart';
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
      style: formErrorTextStyle.merge(style),
    );
  }
}
