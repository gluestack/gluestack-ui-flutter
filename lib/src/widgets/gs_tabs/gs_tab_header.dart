import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_gesture_detector/public.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tabs_tab_style.dart';
import 'gs_tab_indicator.dart';

class GSTabHeader extends StatelessWidget {
  final PageController controller;
  final GSStyle? style;
  final bool? disabled;
  final List<Widget> tabs;
  final Color indicatorColor;

  const GSTabHeader({
    super.key,
    required this.controller,
    required this.tabs,
    this.indicatorColor = const Color.fromARGB(170, 255, 0, 255),
    this.style,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GSStyleBuilder(
      child: Builder(builder: (context) {
        final styler = resolveStyles(
          context: context,
          styles: [
            // gsTabsListStyle,
            gsTabsTabStyle,
          ],
          inlineStyle: style,
          isFirst: true,
        );
        print('bg clr: ${styler.bg}');
        return Opacity(
          opacity: disabled! ? 0.5 : 1,
          child: Container(
            decoration: BoxDecoration(
              color: styler.bg ?? const Color.fromARGB(0, 0, 0, 0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: tabs
                      .map((item) => Expanded(
                            child: GsGestureDetector(
                              child: item,
                              onPressed: () {
                                if (controller.positions.isNotEmpty) {
                                  controller.animateToPage(
                                    tabs.indexOf(item),
                                    curve: Curves.easeInOut,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                }
                              },
                            ),
                          ))
                      .toList(),
                ),
                GSTabIndicator(
                  controller: controller,
                  color: indicatorColor,
                  tabsCount: tabs.length,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
