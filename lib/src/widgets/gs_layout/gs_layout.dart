import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_layout/style_gs_layout.dart';

class GSLayout extends StatelessWidget {
  final Widget body;
  final GlueStyle? style;
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

    return GSBox(
      style: GlueStyle.fromGSStyle(styler, context),
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
