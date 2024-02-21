import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ProgressColorsPreview extends StatelessWidget {
  const ProgressColorsPreview({super.key});

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
              style: GSStyle(width: 300, height: 200),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSProgress(
                    value: 0.55,
                    style: GSStyle(progressValueColor: $GSColors.rose400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSProgress(
                    value: 0.55,
                    style: GSStyle(progressValueColor: $GSColors.blue500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSProgress(
                    value: 0.55,
                    style: GSStyle(progressValueColor: $GSColors.green500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSProgress(
                    value: 0.55,
                    style: GSStyle(progressValueColor: $GSColors.orange500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
