import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_image.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_style.dart';

class GSAvatar extends StatelessWidget {
  final GSSizes? size;
  final GSStyle? style;
  final double? radius;
  final Widget? fallBackText;
  final ImageProvider? backgroundImage;
  final ImageProvider? foregroundImage;
  final ImageErrorListener? onBackgroundImageError;
  final ImageErrorListener? onForegroundImageError;
  final double? minRadius;
  final double? maxRadius;
  final GSAvatarImage avatarImage;

  const GSAvatar(
      {super.key,
      this.style,
      this.fallBackText,
      this.radius,
      this.minRadius,
      this.maxRadius,
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
      child: CircleAvatar(
        minRadius: minRadius,
        maxRadius: maxRadius,
        radius: radius ?? styler.height,
        backgroundImage: backgroundImage,
        foregroundImage: NetworkImage(avatarImage.imageUrl),
        onBackgroundImageError: onBackgroundImageError,
        onForegroundImageError: onForegroundImageError,
        backgroundColor: styler.bg,
        foregroundColor: styler.color,
        child: fallBackText,
      ),
    );
  }
}
