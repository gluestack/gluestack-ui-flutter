import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_badge.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_fall_back_text.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_style.dart';
import 'package:gluestack_ui/src/widgets/gs_image/gs_image.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSAvatarSizes {
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
}

enum GSAvatarRadius { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $full }

class GSAvatar extends StatelessWidget {
  final GSAvatarSizes? size;
  final GSAvatarRadius? radius;
  final GSStyle? style;
  final GSAvatarFallBackText? fallBackText;
  final ImageProvider? backgroundImage;

  ///This takes precedence over [avatarImage]!
  final ImageProvider? foregroundImage;
  final ImageErrorListener? onBackgroundImageError;
  final ImageErrorListener? onForegroundImageError;
  final GSImage? avatarImage;
  final GSAvatarBadge? avatarBadge;

  const GSAvatar({
    super.key,
    this.style,
    this.fallBackText,
    this.radius,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.size,
    this.avatarImage,
    this.avatarBadge,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = size?.toGSSize ?? avatarStyle.props?.size;
    final avatarRadius = radius?.toGSBorderRadius ?? GSBorderRadius.$full;

    GSStyle styler = resolveStyles(
      context: context,
      styles: [avatarStyle, avatarStyle.sizeMap(avatarSize)],
      inlineStyle: style,
    );

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: Stack(
        children: [
          Container(
            width: styler.width,
            height: styler.height,
            decoration: BoxDecoration(
              shape: avatarRadius == GSBorderRadius.$full
                  ? BoxShape.circle
                  : BoxShape.rectangle,
              color: styler.bg,
              image: backgroundImage != null
                  ? DecorationImage(
                      image: backgroundImage!,
                      onError: onBackgroundImageError,
                      fit: BoxFit.cover,
                    )
                  : null,
              borderRadius: avatarRadius != GSBorderRadius.$full
                  ? BorderRadius.circular(
                      GSAvatarStyle.borderRadius[avatarRadius] ??
                          styler.borderRadius ??
                          50)
                  : null,
            ),
            foregroundDecoration: foregroundImage != null
                ? BoxDecoration(
                    color: styler.color,
                    image: DecorationImage(
                      image: foregroundImage!,
                      onError: onForegroundImageError,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(
                        GSAvatarStyle.borderRadius[avatarRadius] ??
                            styler.borderRadius ??
                            50),
                  )
                : BoxDecoration(
                    color: styler.color,
                    image: switch (avatarImage?.imageType) {
                      GSImageType.network => DecorationImage(
                          image: NetworkImage(avatarImage!.path),
                          onError: onForegroundImageError,
                          fit: BoxFit.cover,
                        ),
                      GSImageType.asset => DecorationImage(
                          image: AssetImage(avatarImage!.path),
                          onError: onForegroundImageError,
                          fit: BoxFit.cover,
                        ),
                      null => null,
                    },
                    borderRadius: BorderRadius.circular(
                      GSAvatarStyle.borderRadius[avatarRadius] ??
                          styler.borderRadius ??
                          50,
                    ),
                  ),
            child: Center(child: fallBackText),
          ),

          //GS Badge Widget
          if (avatarBadge != null &&
              avatarBadge?.right == null &&
              avatarBadge?.bottom == null &&
              avatarBadge?.top == null &&
              avatarBadge?.left == null)
            Positioned(
              right: 0,
              left: avatarBadge?.left,
              top: avatarBadge?.top,
              bottom: 0,
              child: avatarBadge as Widget,
            )
          else if (avatarBadge != null)
            Positioned(
              right: avatarBadge?.right,
              left: avatarBadge?.left,
              top: avatarBadge?.top,
              bottom: avatarBadge?.bottom,
              child: avatarBadge as Widget,
            ),
        ],
      ),
    );
  }
}
