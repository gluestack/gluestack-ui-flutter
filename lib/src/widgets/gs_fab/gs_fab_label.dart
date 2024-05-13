import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_label_style.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_provider.dart';

class GSFabLabel extends StatelessWidget {
  final String text;
  final GSStyle? style;

  const GSFabLabel({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSFabProvider.of(context)
        ?.descendantStyles?[fabLabelConfig.ancestorStyle.first];

    // Resolve the final style
    final styler = resolveStyles(
      context: context,
      styles: [
        fabLabelStyle,
        ancestorStyles,
      ],
      inlineStyle: style,
    );

    return Text(
      text,
      style: styler.textStyle
          ?.merge(TextStyle(color: styler.color?.getColor(context))),
    );
  }
}
