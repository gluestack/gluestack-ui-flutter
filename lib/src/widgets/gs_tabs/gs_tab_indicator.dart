import 'package:flutter/widgets.dart';

class GSTabIndicator extends StatefulWidget {
  final double? indicatorWidth;
  final PageController controller;
  final int tabsCount;
  final Color? color;
  final Duration? duration;

  const GSTabIndicator({
    super.key,
    required this.controller,
    required this.tabsCount,
    this.color,
    this.duration = const Duration(milliseconds: 200),
    this.indicatorWidth,
  });

  @override
  GSTabIndicatorState createState() => GSTabIndicatorState();
}

class GSTabIndicatorState extends State<GSTabIndicator> {
  @override
  void initState() {
    widget.controller.addListener(() {
      //update state
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double indicatorWidth = widget.indicatorWidth ??
        MediaQuery.of(context).size.width / widget.tabsCount;
    // final double pageOffset =
    //     widget.controller.hasClients ? widget.controller.page ?? 0 : 0;
    //StoryBook Device change fix
    late double pageOffset;
    try {
      pageOffset =
          widget.controller.hasClients ? widget.controller.page ?? 0 : 0;
    } catch (e) {
      pageOffset = 0;
    }
    final double leftPaddingFraction =
        pageOffset * (widget.indicatorWidth ?? indicatorWidth);

    return AnimatedContainer(
      padding: EdgeInsets.only(left: leftPaddingFraction),
      duration: widget.duration!,
      alignment: Alignment.centerLeft,
      child: Container(
        width: widget.indicatorWidth ?? indicatorWidth,
        color: widget.color ?? const Color(0xffaa2132),
        height: 2,
      ),
    );
  }
}
