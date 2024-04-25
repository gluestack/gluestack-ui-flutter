import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tabs_tab_style.dart';

import '../../style/style_resolver.dart';

class GSRawTab extends StatelessWidget {
  final GSStyle? style;
  final Widget child;
  final Alignment? alignment;
  final Function() callback;
  const GSRawTab(
      {super.key,
      this.style,
      required this.child,
      this.alignment,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return GSStyleBuilder(
      child: Builder(builder: (context) {
        final styler = resolveStyles(
          context: context,
          styles: [
            gsTabsTabStyle,
          ],
          inlineStyle: style,
          isFirst: true,
        );

        return GsGestureDetector(
          onPressed: callback,
          child: Container(
            decoration: BoxDecoration(
              color: styler.bg,
            ),
            alignment: alignment,
            child: Padding(
              padding: styler.padding ?? const EdgeInsets.only(bottom: 2),
              child: child,
            ),
          ),
        );
      }),
    );
  }
}
