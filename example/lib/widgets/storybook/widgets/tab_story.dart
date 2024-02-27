import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
// final List<Option<int>> sizeOptions = [
//   Option<int>(value: 0, label: GSSizes.$sm.name),
//   Option<int>(value: 1, label: GSSizes.$md.name),
//   Option<int>(value: 2, label: GSSizes.$lg.name),
// ];

// final List<Option<int>> placementOptions = [
//   Option<int>(value: 0, label: GSPlacements.topLeft.name),
//   Option<int>(value: 1, label: GSPlacements.topCenter.name),
//   Option<int>(value: 2, label: GSPlacements.topRight.name),
//   Option<int>(value: 3, label: GSPlacements.bottomLeft.name),
//   Option<int>(value: 4, label: GSPlacements.bottomCenter.name),
//   Option<int>(value: 5, label: GSPlacements.bottomRight.name),
// ];

final class TabStory extends StoryWidget {
  final controller = GSTabController();

  @override
  Story createStoryWidget() {
    return Story(
        name: storyName,
        builder: (context) {
          final theme = GSTheme.of(context);

          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: theme.menuColor,
              title: const GSText(
                text: "TabBar Example",
                size: GSSizes.$xl,
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: GSTabHeader(
                  controller: controller,
                  tabs: const [
                    GSTab(
                        child:
                            GSText(text: 'Hey', textAlign: TextAlign.center)),
                    GSTab(
                        child:
                            GSText(text: 'Hi :)', textAlign: TextAlign.center)),
                    GSTab(
                        child:
                            GSText(text: 'Hello', textAlign: TextAlign.center)),
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
        });
  }

  @override
  String get routePath => "tab-preview";

  @override
  String get storyName => "Tab";
}
