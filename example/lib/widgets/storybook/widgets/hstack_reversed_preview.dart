import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class HStackReversedPreview extends StatelessWidget {
  const HStackReversedPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'HStack',
        stories: [
          Story(
            name: 'HStack',
            builder: (context) => GSHStack(
              space: GSHstackSpaces.$md,
              mainAxisAlignment: MainAxisAlignment.center,
              isReversed: true,
              children: [
                GSBox(
                  style:
                      GlueStyle(height: 100, width: 100, bg: $GSColors.blue300),
                  child: const Text('1'),
                ),
                GSBox(
                  style:
                      GlueStyle(height: 100, width: 100, bg: $GSColors.blue400),
                  child: const Text('2'),
                ),
                GSBox(
                  style:
                      GlueStyle(height: 100, width: 100, bg: $GSColors.blue500),
                  child: const Text('3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
