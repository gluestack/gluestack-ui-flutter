import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LoadingButtonPreview extends StatelessWidget {
  const LoadingButtonPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
        context,
        Storybook(
          initialStory: 'Button',
          initialLayout: Layout.compact,
          stories: [
            Story(
              name: 'Button',
              builder: (context) => GSButton(
                child: GSHStack(
                  children: [
                    GSSpinner(
                      strokeWidth: 2,
                      style: GSStyle(
                        color: $GSColors.white,
                        bg: $GSColors.blueGray300,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    GSButtonText(
                      text: "Please wait",
                      style: GSStyle(),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}
