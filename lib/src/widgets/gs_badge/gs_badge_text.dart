import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_text_style.dart';

/// GSBadgeText is a Flutter widget that displays a text within a GSBadge widget.
class GSBadgeText extends StatelessWidget {
  // The text to be displayed inside the badge.
  final String text;
  // Style for the badge text. Can be customized using GSStyle.
  final GSStyle? style;

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
    final GSConfigStyle? ancestorStyles = GSAncestorProvider.of(context)
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

    // Create a Text widget with the specified text and merged style.
    return Text(
      text,
      style: styler.textStyle
          ?.merge(TextStyle(color: styler.color?.getColor(context))),
    );
  }
}
