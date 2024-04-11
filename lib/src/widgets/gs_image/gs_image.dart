import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_image/gs_image_style.dart';

/// Types of images that can be displayed by [GSImage].
enum GSImageType {
  network,
  asset,
}

/// Predefined radius for [GSImage].
enum GSImageRadius {
  $none,
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
  $3xl,
  $full,
}

/// A widget that displays an image with customizable styling options including size, border radius, and more.
/// [GSImage] supports both network and asset images, making it versatile for various use cases.
class GSImage extends StatelessWidget {
  /// The size category of the image, influencing its dimensions.
  final GSImageSizes? size;

  /// The border radius category of the image, influencing the roundness of its corners.
  final GSImageRadius? borderRadius;

  /// The path or URL of the image to be displayed.
  final String path;

  /// The type of image, specifying whether it's a network or asset image.
  final GSImageType imageType;

  /// Custom [GSStyle] to apply to the image, allowing for further customization.
  final GSStyle? style;

  /// The alignment of the image within its container.
  final AlignmentGeometry alignment;

  /// Optional height to cache the image at for improved performance.
  final int? cacheHeight;

  /// Optional width to cache the image at for improved performance.
  final int? cacheWidth;

  /// An optional slice of the image to stretch when scaling.
  final Rect? centerSlice;

  /// Optional color to apply to the image with an optional blend mode.
  final Color? color;
  final BlendMode? colorBlendMode;

  /// A builder function for customizing the display of errors.
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  /// How the image should fit within its allocated space.
  final BoxFit? fit;

  /// Whether to exclude the image from the semantics tree.
  final bool excludeFromSemantics;

  /// The quality of filtering to use when scaling the image.
  final FilterQuality filterQuality;

  /// A builder function for customizing the display of image frames.
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;

  /// A builder function for customizing the display while the image is loading.
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;

  /// Whether the new image should replace the old image without changing the key.
  final bool gaplessPlayback;

  /// Optional headers for network image requests.
  final Map<String, String>? headers;

  /// Whether to apply anti-aliasing to the image.
  final bool isAntiAlias;

  /// Whether the image should match the text direction.
  final bool matchTextDirection;

  /// An animation for the image opacity.
  final Animation<double>? opacity;

  /// How the image should be repeated within its bounds.
  final ImageRepeat repeat;

  /// The scale factor to apply to the image.
  final double scale;

  /// Optional semantic label for the image.
  final String? semanticLabel;
  const GSImage({
    super.key,
    required this.path,
    required this.imageType,
    this.style,
    this.borderRadius = GSImageRadius.$none,
    this.cacheHeight,
    this.cacheWidth,
    this.centerSlice,
    this.color,
    this.colorBlendMode,
    this.errorBuilder,
    this.fit,
    this.size,
    this.frameBuilder,
    this.headers,
    this.loadingBuilder,
    this.opacity,
    this.semanticLabel,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.filterQuality = FilterQuality.low,
    this.alignment = Alignment.center,
    this.excludeFromSemantics = false,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final imageSize = size?.toGSSize ?? imageStyle.props?.size;
    final imageRadius = borderRadius?.toGSBorderRadius ?? GSBorderRadius.$none;

    GSStyle styler = resolveStyles(
        context: context,
        styles: [
          imageStyle,
          imageStyle.sizeMap(imageSize),
        ],
        inlineStyle: style,
        isFirst: true);

    return imageRadius == GSBorderRadius.$none
        ? _resolveImageType(imageType, styler)
        : imageRadius == GSBorderRadius.$full
            ? ClipOval(
                child: SizedBox.fromSize(
                    size: Size(styler.width!, styler.height!),
                    child: _resolveImageType(imageType, styler,
                        boxFit: BoxFit.cover)))
            : ClipRRect(
                borderRadius: imageRadius != GSBorderRadius.$none
                    ? BorderRadius.circular(GSImageStyle.radius[imageRadius]!)
                    : BorderRadius.zero,
                child:
                    _resolveImageType(imageType, styler, boxFit: BoxFit.cover));
  }

  Widget _resolveImageType(GSImageType imageType, GSStyle styler,
      {BoxFit? boxFit}) {
    switch (imageType) {
      case GSImageType.network:
        return Image.network(
          height: styler.height,
          width: styler.width,
          alignment: alignment,
          cacheHeight: cacheHeight,
          cacheWidth: cacheWidth,
          centerSlice: centerSlice,
          color: color,
          colorBlendMode: colorBlendMode,
          errorBuilder: errorBuilder,
          fit: fit ?? boxFit,
          excludeFromSemantics: excludeFromSemantics,
          filterQuality: filterQuality,
          frameBuilder: frameBuilder,
          gaplessPlayback: gaplessPlayback,
          headers: headers,
          isAntiAlias: isAntiAlias,
          loadingBuilder: loadingBuilder,
          matchTextDirection: matchTextDirection,
          opacity: opacity,
          repeat: repeat,
          scale: scale,
          semanticLabel: semanticLabel,
          path,
        );
      case GSImageType.asset:
        return Image.asset(
          height: styler.height,
          width: styler.width,
          alignment: alignment,
          cacheHeight: cacheHeight,
          cacheWidth: cacheWidth,
          centerSlice: centerSlice,
          color: color,
          colorBlendMode: colorBlendMode,
          errorBuilder: errorBuilder,
          fit: fit,
          excludeFromSemantics: excludeFromSemantics,
          filterQuality: filterQuality,
          frameBuilder: frameBuilder,
          gaplessPlayback: gaplessPlayback,
          isAntiAlias: isAntiAlias,
          matchTextDirection: matchTextDirection,
          opacity: opacity,
          repeat: repeat,
          scale: scale,
          semanticLabel: semanticLabel,
          path,
        );
    }
  }
}
