import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class ScrollStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSBox(
        style: GlueStyle(
            height: 250, borderColor: $GSColors.blue400, borderWidth: 2),
        child: GSScrollView(
          children: [
            for (int i = 0; i < 100; i++)
              GSText(
                text: 'Widget No. $i',
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }

  @override
  String get routePath => "scroll-preview";

  @override
  String get storyName => "Scroll";
}
