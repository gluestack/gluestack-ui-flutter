import 'package:flutter/widgets.dart';
import 'gs_tab_indicator.dart';

class GSTabHeader extends StatelessWidget {
  final PageController controller;
  final List<Widget> tabs;
  final Color indicatorColor;
  final Color backgroundColor;
  final Color foregroundColor;

  const GSTabHeader({
    super.key,
    required this.controller,
    required this.tabs,
    this.backgroundColor = const Color(0xfffffffff),
    this.indicatorColor = const Color.fromARGB(170, 255, 0, 255),
    this.foregroundColor = const Color.fromARGB(170, 0, 255, 136),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: tabs
                .map((item) => Expanded(
                      child: GestureDetector(
                        child: item,
                        onTap: () {
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
    );
  }
}
