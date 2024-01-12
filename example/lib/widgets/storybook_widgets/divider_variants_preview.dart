import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class DividerVariantsPreview extends StatelessWidget {
  const DividerVariantsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Divider',
        stories: [
          Story(
            name: 'Divider',
            builder: (context) => GSBox(
              style: GSStyle(width: 400, height: 100),
              child: GSVStack(
                children: [
                  GSHStack(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const GSText(
                        text: "Simple",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GSDivider(
                        orientation: GSOrientations.vertical,
                        style: GSStyle(
                          height: 30,
                          color: $GSColors.rose300,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const GSText(
                        text: "Easy",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GSDivider(
                        orientation: GSOrientations.vertical,
                        style: GSStyle(
                          height: 30,
                          color: $GSColors.green300,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const GSText(
                        text: "Difficult",
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // GSVStack(
                  //   children: [
                  //     const GSText(
                  //       text: "Firefox",
                  //     ),
                  //     GSDivider(
                  //       orientation: GSOrientations.horizontal,
                  //       style: GSStyle(height: 30),
                  //     ),
                  //     const GSText(
                  //       text: "Chrome",
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
