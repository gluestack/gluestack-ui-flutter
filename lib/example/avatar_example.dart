import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_fallBack_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_image.dart';

class AvatarExample extends StatelessWidget {
  const AvatarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GSAvatar(
              size: GSSizes.$sm,
              avatarImage: const GSAvatarImage(
                imageUrl: "https://placehold.co/100x100/png",
              ),
              fallBackText: GSAvatarFallBackText(
                'KS',
                overflow: TextOverflow.ellipsis,
                style: GSStyle(
                    textStyle: const TextStyle(color: $GSColors.primary700)),
              ),
            ),
            GSAvatar(
              size: GSSizes.$2xl,
              style: GSStyle(
                bg: Colors.black,
                textStyle: const TextStyle(color: Colors.white),
              ),
              avatarImage: const GSAvatarImage(
                imageUrl: "https://placehold.co/300x300/png",
              ),
              fallBackText: const GSAvatarFallBackText(
                'HHasdfns.kdnfskadnfksdfsdfsadf',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
