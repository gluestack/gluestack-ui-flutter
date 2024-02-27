import 'package:flutter/widgets.dart';

class GSTabContent extends StatelessWidget {
  final PageController controller;
  final List<Widget> children;
  final ScrollPhysics physics;
  final bool pageSnapping;

  const GSTabContent({
    super.key,
    required this.controller,
    required this.children,
    this.physics = const BouncingScrollPhysics(),
    this.pageSnapping = true,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      pageSnapping: pageSnapping,
      physics: physics,
      children: children,
    );
  }
}
