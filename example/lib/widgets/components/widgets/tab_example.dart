import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class TabExample extends StatefulWidget {
  const TabExample({super.key});

  @override
  State<TabExample> createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample> {
  final controller = GSTabController();

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 3), () {
    //   controller.jumpToPage(3);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "GS Tabs",
          size: GSSizes.$xl,
        ),
      ),
      body: Column(
        children: [
          GSTabHeader(
            style: GSStyle(
              color: $GSColors.amber400, //sets indicator color
              // bg: $GSColors.amber400, //sets tab header bg color
            ),
            controller: controller,
            tabs: [
              GSTab(child: GSText(text: 'Hey', textAlign: TextAlign.center)),
              GSTab(child: GSText(text: 'Hi :)', textAlign: TextAlign.center)),
              GSTab(child: GSText(text: 'Hello', textAlign: TextAlign.center)),
            ],
          ),
          GSTabContent(
            controller: controller,
            children: <Widget>[
              Container(color: Colors.yellow),
              Container(color: Colors.red),
              Container(color: Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}
