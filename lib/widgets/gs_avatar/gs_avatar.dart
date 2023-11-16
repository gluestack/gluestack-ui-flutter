import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_image.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_style.dart';

class GSAvatar extends StatelessWidget {
  final GSSizes? size;
  final GSStyle? style;
  final GSBorderRadius? radius;
  final Widget? fallBackText;
  final ImageProvider? backgroundImage;
  final ImageProvider? foregroundImage;
  final ImageErrorListener? onBackgroundImageError;
  final ImageErrorListener? onForegroundImageError;
  final GSAvatarImage avatarImage;

  const GSAvatar(
      {super.key,
      this.style,
      this.fallBackText,
      this.radius,
      this.backgroundImage,
      this.foregroundImage,
      this.onBackgroundImageError,
      this.onForegroundImageError,
      this.size,
      required this.avatarImage});

  @override
  Widget build(BuildContext context) {
    final avatarSize = size ?? avatarStyle.props?.size;

    GSStyle styler = resolveStyles(
      context,
      variantStyle: avatarStyle,
      size: GSAvatarStyle.size[avatarSize],
      inlineStyle: style,
    )!;

    return GSAvatarProvider(
      badgeRaidus: styler.badgeHeight,
      textStyle: styler.textStyle,
      child: Container(
        decoration: BoxDecoration(
            color: styler.bg,
            image: backgroundImage != null
                ? DecorationImage(
                    image: backgroundImage!,
                    onError: onBackgroundImageError,
                    fit: BoxFit.cover,
                  )
                : null,
            borderRadius: BorderRadius.circular(
                GSAvatarStyle.borderRadius[radius] ??
                    styler.borderRadius ??
                    50)),
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
                        50))
            : null,
        child: fallBackText,
      ),
    );
  }
}
