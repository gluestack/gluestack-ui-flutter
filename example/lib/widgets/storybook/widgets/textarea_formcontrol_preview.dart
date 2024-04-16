import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TextareaFormControlPreview extends StatelessWidget {
  const TextareaFormControlPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Textarea',
        stories: [
          Story(
            name: 'Textarea',
            builder: (context) => GSVStack(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GSHeading(text: "Write with me"),
                const SizedBox(
                  height: 10,
                ),
                GSTextArea(
                  hintText: "Once upon a time...",
                  style: GSStyle(
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const GSText(text: "Start your story"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
