import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BadgeWithAvatarPreview extends StatelessWidget {
  const BadgeWithAvatarPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Badge',
        stories: [
          Story(
            name: 'Badge',
            builder: (context) => GSBox(
              style: GSStyle(width: 300, height: 200),
              child: GSHStack(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GSAvatar(
                    size: GSSizes.$md,
                    style: GSStyle(bg: $GSColors.backgroundLight600),
                    avatarImage: const GSImage(
                      imageType: GSImageType.network,
                      path:
                          'https://images.unsplash.com/photo-1488161628813-04466f872be2?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    fallBackText: const GSAvatarFallBackText(
                      'Rax Martin',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const GSHeading(text: "Ronald Richards"),
                  const SizedBox(
                    width: 10,
                  ),
                  const GSBadge(
                    action: GSActions.success,
                    text: GSBadgeText(
                      "Verified",
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
