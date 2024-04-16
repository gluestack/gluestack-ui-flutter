import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/form_label_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';

class GSFormLabelText extends StatelessWidget {
  final String text;
  final GlueStyle? style;
  final bool? isRequired;
  const GSFormLabelText(this.text, {super.key, this.style, this.isRequired});

  @override
  Widget build(BuildContext context) {
    final isLabelRequired =
        isRequired ?? GSFormProvider.of(context)?.isRequired ?? false;
    final size = GSFormProvider.of(context)?.size;

    final styler = resolveStyles(
      context: context,
      styles: [formLabelTextStyle],
      inlineStyle: style,
      isFirst: true,
    );

    return isLabelRequired
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GSText(
                text: text,
                size: size,
                style: GlueStyle.fromGSStyle(styler, context),
              ),
              const SizedBox(width: 2),
              GSText(
                text: '*',
                size: size,
                style: GlueStyle(
                    textStyle: const TextStyle(color: Color(0xFFFF0000))),
              )
            ],
          )
        : GSText(
            text: text,
            style: GlueStyle.fromGSStyle(styler, context),
          );
  }
}
