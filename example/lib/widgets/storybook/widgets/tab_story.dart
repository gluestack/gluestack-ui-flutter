import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class TabStory extends StoryWidget {
  final controller = GSTabController();

  @override
  Story createStoryWidget() {
    return Story(
        name: storyName,
        builder: (context) {
          return GSLayout(
            body: GSVStack(
              children: [
                GSBox(
                  style: GlueStyle(height: 45),
                  child: const GSCenter(
                    child: GSText(
                      text: 'Tab Example',
                    ),
                  ),
                ),
                GSTabHeader(
                  isDisabled: context.knobs
                      .boolean(label: 'isDisabled', initial: false),
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
        });
  }

  @override
  String get routePath => "tab-preview";

  @override
  String get storyName => "Tab";
}
