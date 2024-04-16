import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_text_style.dart';

/// GSBadgeText is a Flutter widget that displays a text within a GSBadge widget.
class GSBadgeText extends StatelessWidget {
  // The text to be displayed inside the badge.
  final String text;
  // Style for the badge text. Can be customized using GSStyle.
  final GlueStyle? style;

  /// Constructor for GSBadgeText widget:
  const GSBadgeText(
    //takes string as input just like inbuilt Text widget from flutter
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    // Access the ancestor provider to retrieve ancestor text styles.
    final GSStyle? ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsBadgeTextConfig.ancestorStyle.first];
    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        badgeTextStyle,
        badgeTextStyle.sizeMap(ancestorStyles?.props?.size),
        ancestorStyles,
      ],
      inlineStyle: style,
    );

    // Define default text style based on badge provider and ancestor text styles.
    final textStyle = TextStyle(
      fontSize: styler.textStyle?.fontSize,
      color: styler.color?.getColor(context),
      fontWeight: styler.textStyle?.fontWeight,
      decoration: styler.textStyle?.decoration,
      height: styler.textStyle?.height,
    );

    // Create a Text widget with the specified text and merged style.
    return Text(
      text,
      style: textStyle,
    );
  }
}
