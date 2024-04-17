import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_toast/gs_toast_description_style.dart';

class GSToastDescription extends StatelessWidget {
  final String description;
  final GSStyle? style;
  const GSToastDescription({super.key, required this.description, this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gstoastDescriptionConfig.ancestorStyle.first];

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [
        toastDescriptionStyle,
        ancestorTextStyles,
      ],
      inlineStyle: style,
    );
    return GSText(
      text: description,
      style: GSStyle.fromGSConfigStyle(styler, context),
    );
  }
}
