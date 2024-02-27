import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';
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
        // print('bg: ${styler.bg}');
        // print('padding: ${styler.padding}');
        //Check padding
        return GsGestureDetector(
          onPressed: callback,
          child: Container(
            decoration: BoxDecoration(
              // color: Color.fromARGB(255, 255, 0, 0),
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
