import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_selection_header_text_style.dart';

/// GSSelectHeaderText is a Flutter widget that displays a text within a GSBadge widget.
class GSSelectHeaderText extends StatelessWidget {
  // The text to be displayed inside the badge.
  final String text;
  // Style for the badge text. Can be customized using GSStyle.
  final GSStyle? style;

  /// Constructor for GSSelectHeaderText widget:
  const GSSelectHeaderText(
    //takes string as input just like inbuilt Text widget from flutter
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSSelectProvider.of(context);

    final styler = resolveStyles(
      context: context,
      styles: [
        selectSelectionHeaderTextStyle,
        selectSelectionHeaderTextStyle.sizeMap(value?.headerFontSize),
        // ancestorStyles,
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
