import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_gesture_detector/public.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tab_raw.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tabs_tab.dart';
import 'package:gluestack_ui/src/widgets/gs_tabs/gs_tabs_tab_style.dart';
import 'gs_tab_indicator.dart';

class GSTabHeader extends StatefulWidget {
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
  State<GSTabHeader> createState() => _GSTabHeaderState();
}

class _GSTabHeaderState extends State<GSTabHeader> {
  double? indicatorWidth;
  final GlobalKey tabWidthKey = GlobalKey();

  void onTabTap() {
    final RenderBox? renderBox =
        tabWidthKey.currentContext?.findRenderObject() as RenderBox?;
    setState(() {
      indicatorWidth = renderBox?.size.width;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, onTabTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('indi width:: $indicatorWidth');

    return Opacity(
      opacity: widget.disabled! ? 0.5 : 1,
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < widget.tabs.length; i++)
                Expanded(
                  child: GSRawTab(
                    key: i == 0 ? tabWidthKey : null,
                    alignment: widget.tabs[i].alignment,
                    style: widget.tabs[i].style,
                    child: widget.tabs[i].child,
                    callback: () {
                      if (widget.controller.positions.isNotEmpty) {
                        widget.controller.animateToPage(
                          widget.tabs.indexOf(widget.tabs[i]),
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
              width: indicatorWidth != -1 ? indicatorWidth : null,
              controller: widget.controller,
              color: widget.indicatorColor,
              tabsCount: widget.tabs.length,
            ),
          ),
        ],
      ),
    );
  }
}
