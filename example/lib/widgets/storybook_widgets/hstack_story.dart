import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> spaceOption = [
  Option<int>(value: 0, label: GSSpaces.$none.name),
  Option<int>(value: 1, label: GSSpaces.$xs.name),
  Option<int>(value: 2, label: GSSpaces.$sm.name),
  Option<int>(value: 3, label: GSSpaces.$md.name),
  Option<int>(value: 4, label: GSSpaces.$lg.name),
  Option<int>(value: 5, label: GSSpaces.$xl.name),
  Option<int>(value: 6, label: GSSpaces.$2xl.name),
  Option<int>(value: 7, label: GSSpaces.$3xl.name),
  Option<int>(value: 8, label: GSSpaces.$4xl.name),
];

final class HStackStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSHStack(
        mainAxisAlignment: MainAxisAlignment.center,
        space: GSHstackSpaces.values[context.knobs
            .options(label: 'Space', initial: 0, options: spaceOption)],
        isReversed: context.knobs.boolean(label: "isReversed", initial: false),
        children: [
          GSBox(
            style: GSStyle(height: 100, width: 100, bg: $GSColors.blue300),
            child: const Text('1'),
          ),
          GSBox(
            style: GSStyle(height: 100, width: 100, bg: $GSColors.blue400),
            child: const Text('2'),
          ),
          GSBox(
            style: GSStyle(height: 100, width: 100, bg: $GSColors.blue500),
            child: const Text('3'),
          ),
        ],
      ),
    );
  }

  @override
  String get routePath => "hstack-preview";

  @override
  String get storyName => "HStack";
}
