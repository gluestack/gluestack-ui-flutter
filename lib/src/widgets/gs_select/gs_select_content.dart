import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_content_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_style.dart';

class GSSelectContent extends StatelessWidget {
  final GSStyle? style;

  const GSSelectContent({
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final contentStyler = resolveStyles(
      context: context,
      styles: [selectContentStyle],
      inlineStyle: style,
    );

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [selectStyle],
      inlineStyle: style,
    );

    return Container(
      height: style?.height ?? styler.height ?? 200,
      width: style?.width ?? styler.width ?? 200,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(style?.borderRadius ?? 6)),
        color: contentStyler.bg?.getColor(context),
      ),
      child: null, // Placeholder for the internal child
    );
  }

  // Internal method to create GSSelectContent with child
  static Widget withChild({
    required Widget child,
    required BuildContext context,
    GSStyle? style,
  }) {
    return GSSelectContent(
      style: style,
    )._withChild(child, context);
  }

  // Private method to pass child internally
  Widget _withChild(Widget child, BuildContext context) {
    final contentStyler = resolveStyles(
      context: context,
      styles: [selectContentStyle],
      inlineStyle: style,
    );

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [selectStyle],
      inlineStyle: style,
    );

    return Container(
      height: style?.height ?? styler.height ?? 200,
      width: style?.width ?? styler.width ?? 200,
      padding: style?.padding ?? contentStyler.padding,
      decoration: BoxDecoration(
        border: Border.all(
            color: style?.borderColor ??
                GSTheme.of(context).border100 ??
                const Color.fromRGBO(0, 0, 0, 0),
            width: style?.borderWidth ?? 1),
        borderRadius:
            BorderRadius.all(Radius.circular(style?.borderRadius ?? 6)),
        color: contentStyler.bg?.getColor(context),
      ),
      child: child,
    );
  }
}
