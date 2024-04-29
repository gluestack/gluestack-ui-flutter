import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_link/gs_link_text_style.dart';

class GSLinkText extends StatelessWidget {
  final String text;

  final GSStyle? style;
  const GSLinkText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final isActive = GSFocusableActionDetectorProvider.isActive(context);
    final ancestorTextStyles =
        GSAncestorProvider.of(context)?.decedentStyles?['_text'];

    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [linkTextStyle.merge(ancestorTextStyles), ancestorTextStyles],
      inlineStyle: style,
      isFirst: true,
    );

    final color = isActive
        ? styler.onActive?.color?.getColor(context)
        : isHovered
            ? styler.onHover?.color?.getColor(context)
            : styler.textStyle?.color ?? styler.color?.getColor(context);
    final TextDecoration? decoration = isActive
        ? styler.onActive?.textStyle?.decoration
        : isHovered
            ? styler.onHover?.textStyle?.decoration
            : styler.textStyle?.decoration;
    var defaultTextStyle = TextStyle(color: color, decoration: decoration);
    final mergedStyle =
        style?.textStyle?.merge(defaultTextStyle) ?? defaultTextStyle;

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
