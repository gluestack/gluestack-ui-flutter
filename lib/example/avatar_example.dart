import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_badge.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_fallBack_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image.dart';

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
              radius: GSBorderRadius.$xl,
              size: GSSizes.$md,
              style: GSStyle(bg: Colors.yellow),
              avatarImage: const GSImage(
                imageType: GSImageType.asset,
                path: "assets/images/button.png",
              ),
              fallBackText: GSAvatarFallBackText(
                'KS',
                overflow: TextOverflow.ellipsis,
                style: GSStyle(
                  textStyle: const TextStyle(color: $GSColors.pink200),
                ),
              ),
              avatarBadge: const GSAvatarBadge(),
            ),
            GSAvatar(
              size: GSSizes.$2xl,
              style: GSStyle(
                bg: Colors.orange,
                textStyle: const TextStyle(color: Colors.white),
              ),
              avatarBadge: GSAvatarBadge(
                left: 0,
                bottom: 0,
                style: GSStyle(
                  bg: Colors.grey,
                  borderRadius: 12,
                ),
              ),
              fallBackText: const GSAvatarFallBackText(
                'Geeky Stack',
              ),
            ),
            GSAvatar(
              size: GSSizes.$xs,
              style: GSStyle(
                bg: Colors.blueAccent,
                textStyle: const TextStyle(color: Colors.white),
              ),
              fallBackText: const GSAvatarFallBackText(
                'Flutter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
