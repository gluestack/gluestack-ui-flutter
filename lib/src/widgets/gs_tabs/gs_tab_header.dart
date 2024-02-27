import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_gesture_detector/public.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tab_raw.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tabs_tab.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tabs_tab_style.dart';
import 'gs_tab_indicator.dart';

class GSTabHeader extends StatelessWidget {
  final PageController controller;
  final GSStyle? style;
  final bool? disabled;
  final List<GSTab> tabs;
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
    return Opacity(
      opacity: disabled! ? 0.5 : 1,
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: tabs
                .map((item) => Expanded(
                      child: GSRawTab(
                        alignment: item.alignment,
                        style: item.style,
                        child: item.child,
                        callback: () {
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
          Positioned(
            bottom: 0,
            child: GSTabIndicator(
              controller: controller,
              color: indicatorColor,
              tabsCount: tabs.length,
            ),
          ),
        ],
      ),
    );
  }
}
