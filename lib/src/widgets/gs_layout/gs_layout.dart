import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_layout/style_gs_layout.dart';

class GSLayout extends StatelessWidget {
  final Widget body;
  final GSStyle? style;
  final Widget? floatingActionButton;
  final AlignmentGeometry floatingActionButtonLocation;
  const GSLayout({
    super.key,
    required this.body,
    this.style,
    this.floatingActionButton,
    this.floatingActionButtonLocation = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context: context,
      styles: [layoutStyle],
      inlineStyle: style,
      isFirst: true,
    );

    final themeBG = getColorMap(context)[styler.color2];

    return GSBox(
      style: styler.merge(GSStyle(bg:themeBG)),
      child: floatingActionButton != null
          ? Stack(
              fit: StackFit.expand,
              children: [
                body,
                Padding(
                  padding: EdgeInsets.all(styler.gap ?? 0),
                  child: Align(
                    alignment: floatingActionButtonLocation,
                    child: floatingActionButton,
                  ),
                ),
              ],
            )
          : body,
    );
  }
}
