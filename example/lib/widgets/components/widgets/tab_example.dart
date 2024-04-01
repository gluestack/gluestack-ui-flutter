import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';

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
      body: BaseLayout(
        code: """
    GSVStack(
            mainAxisSize: MainAxisSize.min,
            children: [
              GSTabHeader(
                style: GSStyle(
                  color: \$GSColors.amber400, //sets indicator color
                  bg: \$GSColors.amber100, //sets tab header bg color
                ),
                controller: controller,
                tabs: [
                  GSTab(
                      child: GSText(text: 'Hey', textAlign: TextAlign.center)),
                  GSTab(
                      child:
                          GSText(text: 'Hi :)', textAlign: TextAlign.center)),
                  GSTab(
                      child:
                          GSText(text: 'Hello', textAlign: TextAlign.center)),
                ],
              ),
              GSTabContent(
                controller: controller,
                children: <Widget>[
                  GSBox(style: GSStyle(color: \$GSColors.yellow400)),
                  GSBox(style: GSStyle(color: \$GSColors.purple600)),
                  GSBox(style: GSStyle(color: \$GSColors.red600)),
                ],
              ),
            ],
          ),
""",
        component: SizedBox(
          height: 300,
          child: GSVStack(
            mainAxisSize: MainAxisSize.min,
            children: [
              GSTabHeader(
                style: GSStyle(
                  color: $GSColors.amber400, //sets indicator color
                  // bg: $GSColors.amber100, //sets tab header bg color
                ),
                controller: controller,
                tabs: const [
                  GSTab(
                      child: GSText(text: 'Hey', textAlign: TextAlign.center)),
                  GSTab(
                      child:
                          GSText(text: 'Hi :)', textAlign: TextAlign.center)),
                  GSTab(
                      child:
                          GSText(text: 'Hello', textAlign: TextAlign.center)),
                ],
              ),
              GSTabContent(
                controller: controller,
                children: <Widget>[
                  GSBox(style: GSStyle(color: $GSColors.yellow400)),
                  GSBox(style: GSStyle(color: $GSColors.purple600)),
                  GSBox(style: GSStyle(color: $GSColors.red600)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
