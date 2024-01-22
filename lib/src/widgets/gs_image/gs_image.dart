import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_image/gs_image_style.dart';

enum GSImageType {
  network,
  file,
  asset,
}

enum GSImageSizes{
  $2xs,
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
}
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

class GSImage extends StatelessWidget {
  final GSImageSizes? size;
  final GSImageRadius? borderRadius;

  final String path;
  final GSImageType imageType;
  final GSStyle? style;
  final AlignmentGeometry alignment;
  final int? cacheHeight;
  final int? cacheWidth;
  final Rect? centerSlice;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final BoxFit? fit;
  final bool excludeFromSemantics;
  final FilterQuality filterQuality;
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;
  final bool gaplessPlayback;
  final Map<String, String>? headers;
  final bool isAntiAlias;
  final bool matchTextDirection;
  final Animation<double>? opacity;
  final ImageRepeat repeat;
  final double scale;
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
      case GSImageType.file:
        return Image.file(
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
          File(path),
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
