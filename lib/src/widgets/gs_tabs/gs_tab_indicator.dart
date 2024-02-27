import 'package:flutter/widgets.dart';

class GSTabIndicator extends StatefulWidget {
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
  });

  @override
  GSTabIndicatorState createState() => GSTabIndicatorState();
}

class GSTabIndicatorState extends State<GSTabIndicator> {
  @override
  void initState() {
    widget.controller.addListener(() {
      //update state
      if(mounted){
      setState(() {});
      }
    });
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    final double indicatorWidth =
        MediaQuery.of(context).size.width / widget.tabsCount;
    final double pageOffset =
        widget.controller.hasClients ? widget.controller.page ?? 0 : 0;
    final double leftPaddingFraction = pageOffset * indicatorWidth;
    // print('---');
    // print(leftPaddingFraction);
    // print(pageOffset);
    // print(indicatorWidth);

    return AnimatedContainer(
      padding: EdgeInsets.only(left: leftPaddingFraction),
      duration: widget.duration!,
      alignment: Alignment.centerLeft,
      child: Container(
        width: indicatorWidth,
        color: widget.color ?? const Color(0xffaa2132),
        height: 2,
      ),
    );
  }
}
