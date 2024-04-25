import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSAvatarRadius { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $full }

/// A customizable avatar widget designed to display user or entity pictures in a visually
/// appealing and flexible manner. The widget supports various sizes, border radii, and
/// styling options, along with fallback text and badge overlays.
class GSAvatar extends StatelessWidget {
  /// The size of the avatar, controlling its overall dimensions. This can be set to one of
  /// the predefined [GSAvatarSizes] values.
  final GSAvatarSizes? size;

  /// The border radius of the avatar, determining the curvature of its corners. This can
  /// be set to one of the predefined [GSAvatarRadius] values to achieve different shapes,
  /// from square to fully rounded. If not specified, the radius defaults based on styling
  /// or context.
  final GSAvatarRadius? radius;

  /// Custom [GSStyle] to apply to the avatar, enabling detailed customization of its appearance.
  /// This style can include border, padding, margin, and more.
  final GSStyle? style;

  /// Text to display within the avatar as a fallback when no image is provided or in case
  /// of an error loading the image. Useful for displaying user initials or default text.
  final GSAvatarFallBackText? fallBackText;

  /// The primary background image of the avatar. This image appears behind any [foregroundImage]
  final ImageProvider? backgroundImage;

  /// The foreground image of the avatar, displayed in front of [backgroundImage]. When set,
  /// this takes precedence over the background image, allowing for layered image effects.
  final ImageProvider? foregroundImage;

  /// Callback function to execute when an error occurs while loading [backgroundImage].
  final ImageErrorListener? onBackgroundImageError;

  /// Callback function to execute when an error occurs while loading [foregroundImage].
  final ImageErrorListener? onForegroundImageError;

  /// An optional GSImage widget to use as the avatar's image.
  final GSImage? avatarImage;

  /// An optional badge to display on top of the avatar. This can be used to indicate status,
  /// notifications, etc.
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
