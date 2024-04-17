import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

class GSBox extends StatelessWidget {
  /// This child will be subjected to the styling and layout constraints specified in [GSBox]. Can be any widget type.
  final Widget? child;

  /// Custom [GSConfigStyle] that defines the appearance and layout parameters for this widget.
  /// This includes colors, padding and more.
  final GSStyle? style;

  /// The way that the child should be clipped. Defaults to [Clip.none], meaning the
  /// child won't be clipped. [Clip.hardEdge], [Clip.antiAlias], and [Clip.antiAliasWithSaveLayer]
  /// are available for clipping with different behaviors.
  final Clip clipBehavior;

  /// The alignment of the transformation applied to the child. If a [transform] is specified,
  /// [transformAlignment] determines the point around which the transform is applied.
  final AlignmentGeometry? transformAlignment;

  /// A matrix to apply as a transformation before painting the child. This can be used
  /// to rotate, scale, translate, or skew the content of the [GSBox].
  final Matrix4? transform;

  /// A decoration to paint in front of the [child]. This is useful for adding visual
  /// effects above the child widget.
  final Decoration? foregroundDecoration;

  /// Additional constraints to apply to the child. [BoxConstraints] can be used to
  /// specify minimum and maximum width and height.
  final BoxConstraints? constraints;

  /// The blend mode applied to the background color or image of the box. This allows
  /// for creative blending effects with the box's background.
  final BlendMode? backgroundBlendMode;

  /// A gradient to use when painting the background. [gradient] allows for smooth
  /// transitions between colors across the [GSBox].
  final Gradient? gradient;

  /// A list of shadows to cast behind the box. Multiple [BoxShadow]s can be applied
  /// to create complex shadow effects.
  final List<BoxShadow>? boxShadow;

  /// An image to paint above the background color of the box. [DecorationImage] allows
  /// for sophisticated background images, including scaling and alignment.
  final DecorationImage? image;

  /// The shape of the box's border. This can either be a rectangle or a circle, with
  /// [BoxShape.rectangle] being the default.
  final BoxShape shape;
  const GSBox({
    super.key,
    this.child,
    this.style,
    this.clipBehavior = Clip.none,
    this.transformAlignment,
    this.transform,
    this.foregroundDecoration,
    this.constraints,
    this.backgroundBlendMode,
    this.gradient,
    this.boxShadow,
    this.image,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    GSConfigStyle styler = resolveStyles(
      context: context,
      inlineStyle: style,
    );

    // print('bg box: ${styler.bg} | ${styler.bg?.getColor(context)}');

    return Visibility(
      visible: styler.isVisible ?? true,
      child: Container(
        clipBehavior: clipBehavior,
        transform: transform,
        transformAlignment: transformAlignment,
        foregroundDecoration: foregroundDecoration,
        // alignment: style != null
        //     ? style!.alignment ?? Alignment.center
        //     : Alignment.center,
        padding: styler.padding,
        margin: styler.margin,
        height: styler.height,
        width: styler.width,
        constraints: BoxConstraints(
          minWidth: style != null ? style!.width ?? 0 : 0,
          minHeight: style != null ? style!.height ?? 0 : 0,
        ),
        // margin: style != null
        //     ? style!.margin ??
        //         const EdgeInsets.symmetric(vertical: 0, horizontal: 0)
        //     : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        decoration: BoxDecoration(
          color:
              //  GSTheme.of(context).primary500 ??
              styler.bg?.getColor(context) ?? styler.color?.getColor(context),
          borderRadius: BorderRadius.circular(
              style != null ? style!.borderRadius ?? 0 : 0),
          border: Border.all(
              color: style != null
                  ? style!.borderColor ?? const Color(0x00000000)
                  : const Color(0x00000000),
              width: style != null ? style!.borderWidth ?? 0 : 0),
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          boxShadow: boxShadow,
          image: image,
          // shape: shape, //will cause error, as borderraidus is defined
        ),
        child: child,
      ),
    );
  }
}
