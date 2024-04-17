import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ProgressCustomPreview extends StatelessWidget {
  const ProgressCustomPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Progress',
        stories: [
          Story(
            name: 'Progress',
            builder: (context) => GSBox(
              style: GSStyle(width: 300, height: 100),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GSHeading(text: "Internal Storage"),
                  const SizedBox(
                    height: 5,
                  ),
                  GSProgress(
                    value: 0.55,
                    style: GSStyle(
                        progressValueColor: $GSColors.green500,
                        bg: $GSColors.green50),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const GSText(text: "14GB"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
