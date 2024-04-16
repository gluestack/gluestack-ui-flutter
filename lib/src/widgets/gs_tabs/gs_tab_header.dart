import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tab_raw.dart';

class GSTabHeader extends StatelessWidget {
  final PageController controller;
  final GlueStyle? style;
  final bool? isDisabled;
  final List<GSTab> tabs;

  const GSTabHeader({
    super.key,
    required this.controller,
    required this.tabs,
    this.style,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Opacity(
        opacity: isDisabled! ? 0.5 : 1,
        child: Stack(
          children: <Widget>[
            Row(
              children: [
                for (int i = 0; i < tabs.length; i++)
                  Expanded(
                    child: GSRawTab(
                      alignment: tabs[i].alignment,
                      style: style?.merge(tabs[i].style),
                      child: tabs[i].child,
                      callback: () {
                        if (controller.positions.isNotEmpty && !isDisabled!) {
                          controller.animateToPage(
                            tabs.indexOf(tabs[i]),
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 500),
                          );
                        }
                      },
                    ),
                  ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: GSTabIndicator(
                indicatorWidth: constraints.maxWidth / tabs.length,
                color: style?.color,
                controller: controller,
                tabsCount: tabs.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
