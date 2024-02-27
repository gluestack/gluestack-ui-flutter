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
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBar Example"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: GSTabHeader(
            controller: controller,
            tabs: const [
              GSTab(child: GSText(text: 'Hey', textAlign: TextAlign.center)),
              GSTab(child: GSText(text: 'Hi :)', textAlign: TextAlign.center)),
              GSTab(child: GSText(text: 'Hello', textAlign: TextAlign.center)),
              // Tab(text: "Tab 2"),
              // Tab(child: Icon(Icons.access_alarm)),
            ],
          ),
        ),
      ),
      body: GSTabContent(
        controller: controller,
        children: <Widget>[
          Container(color: Colors.yellow),
          Container(color: Colors.red),
          Container(color: Colors.purple),
        ],
      ),
    );
  }
}
