import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class FabWithIconPreview extends StatelessWidget {
  const FabWithIconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Fab',
        stories: [
          Story(
            name: 'Fab',
            builder: (context) => GSCenter(
              child: Stack(
                children: [
                  GSBox(
                    style: GSStyle(
                        height: 360,
                        width: 320,
                        borderRadius: $GSRadii.$md,
                        bg: $GSColors.trueGray800,
                        padding: const EdgeInsets.all(20)),
                    child: GSVStack(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  const GSAvatarFallBackText('Kevin James'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const GSVStack(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GSHeading(text: 'Kevin James'),
                                GSText(text: 'Tech Lead'),
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
                                      'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
                                  imageType: GSImageType.network),
                              style: GSStyle(
                                bg: Colors.orange,
                                textStyle: const TextStyle(color: Colors.white),
                              ),
                              fallBackText:
                                  const GSAvatarFallBackText('Jacob Jones'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const GSVStack(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GSHeading(text: 'Jacob Jones'),
                                GSText(text: 'Manager'),
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
                                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                                  imageType: GSImageType.network),
                              style: GSStyle(
                                bg: Colors.orange,
                                textStyle: const TextStyle(color: Colors.white),
                              ),
                              fallBackText:
                                  const GSAvatarFallBackText('Albert Flores'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const GSVStack(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GSHeading(text: 'Albert Flores'),
                                GSText(text: 'HR'),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  GSFab(
                    onPressed: () {},
                    icon: GSFabIcon(
                      icon: Icons.edit_square,
                      style: GSStyle(color: $GSColors.white),
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
