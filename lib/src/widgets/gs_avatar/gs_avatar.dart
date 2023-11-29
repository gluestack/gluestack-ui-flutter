import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_badge.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_fall_back_text.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_style.dart';
import 'package:gluestack_ui/src/widgets/gs_image/gs_image.dart';

class GSAvatar extends StatelessWidget {
  final GSSizes? size;
  final GSStyle? style;
  final GSBorderRadius? radius;
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
    this.radius = GSBorderRadius.$full,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.size,
    this.avatarImage,
    this.avatarBadge,
  }) : assert(
            size != GSSizes.$3xl &&
                size != GSSizes.$4xl &&
                size != GSSizes.$5xl,
            "Size Not Supported");

  @override
  Widget build(BuildContext context) {
    final avatarSize = size ?? avatarStyle.props?.size;

    GSStyle styler = resolveStyles(
      context,
      variantStyle: avatarStyle,
      size: GSAvatarStyle.size[avatarSize],
      inlineStyle: style,
      descendantStyleKeys: gsAvatarConfig.descendantStyle,
    )!;

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: Stack(
        children: [
          Container(
            width: styler.width,
            height: styler.height,
            decoration: BoxDecoration(
              shape: radius == GSBorderRadius.$full
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
              borderRadius: radius != GSBorderRadius.$full
                  ? BorderRadius.circular(GSAvatarStyle.borderRadius[radius] ??
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
                        GSAvatarStyle.borderRadius[radius] ??
                            styler.borderRadius ??
                            50),
                  )
                : BoxDecoration(
                    color: styler.color,
                    image: avatarImage != null
                        ? avatarImage?.imageType == GSImageType.network
                            ? DecorationImage(
                                image: NetworkImage(avatarImage!.path),
                                onError: onForegroundImageError,
                                fit: BoxFit.cover,
                              )
                            : avatarImage?.imageType == GSImageType.asset
                                ? DecorationImage(
                                    image: AssetImage(avatarImage!.path),
                                    onError: onForegroundImageError,
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: FileImage(File(avatarImage!.path)),
                                    onError: onForegroundImageError,
                                    fit: BoxFit.cover,
                                  )
                        : null,
                    borderRadius: BorderRadius.circular(
                        GSAvatarStyle.borderRadius[radius] ??
                            styler.borderRadius ??
                            50),
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
