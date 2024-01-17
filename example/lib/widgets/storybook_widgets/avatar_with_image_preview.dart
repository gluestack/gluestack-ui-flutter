import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AvatarWithImagePreview extends StatelessWidget {
  const AvatarWithImagePreview({super.key});

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
                        avatarImage: const GSImage(
                            path:
                                'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                            imageType: GSImageType.network),
                        style: GSStyle(
                          bg: Colors.orange,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        fallBackText:
                            const GSAvatarFallBackText('Ronald Richards'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const GSVStack(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GSHeading(text: 'Nursing Assistant'),
                          GSText(text: 'Ronald Richards'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSHStack(
                    children: [
                      GSAvatar(
                        avatarImage: const GSImage(
                            path:
                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                            imageType: GSImageType.network),
                        style: GSStyle(
                          bg: Colors.orange,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        fallBackText:
                            const GSAvatarFallBackText('Arlene McCoy'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const GSVStack(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GSHeading(text: 'Arlene McCoy'),
                          GSText(text: 'Marketing Coordinator'),
                        ],
                      )
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
