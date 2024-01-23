import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AvatarWithLabelPreview extends StatelessWidget {
  const AvatarWithLabelPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Avatar',
        stories: [
          Story(
            name: 'Avatar',
            builder: (context) => GSBox(
              style: GSStyle(
                width: 250,
                height: 150,
              ),
              child: GSVStack(
                children: [
                  GSHStack(
                    children: [
                      GSAvatar(
                        style: GSStyle(
                          bg: Colors.orange,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        fallBackText: const GSAvatarFallBackText('Geeky Stack'),
                      ),
                      const GSHeading(text: 'text')
                    ],
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
