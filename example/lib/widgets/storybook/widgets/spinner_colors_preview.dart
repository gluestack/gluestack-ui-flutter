import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SpinnerWithColorsPreview extends StatelessWidget {
  const SpinnerWithColorsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Spinner',
        initialLayout: Layout.compact,
        stories: [
          Story(
            name: 'Spinner',
            builder: (context) => GSBox(
              style: GSStyle(width: 300, height: 200),
              child: GSVStack(
                children: [
                  GSSpinner(
                    strokeWidth: 3,
                    style: GSStyle(
                      bg: $GSColors.blueGray700,
                      color: $GSColors.red400,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GSSpinner(
                    strokeWidth: 3,
                    style: GSStyle(
                      bg: $GSColors.blueGray700,
                      color: $GSColors.orange400,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GSSpinner(
                    strokeWidth: 3,
                    style: GSStyle(
                      bg: $GSColors.blueGray700,
                      color: $GSColors.green400,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GSSpinner(
                    strokeWidth: 3,
                    style: GSStyle(
                      bg: $GSColors.blueGray700,
                      width: 30,
                      height: 30,
                    ),
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
