import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

class GSBox extends StatelessWidget {
  final Widget? child;
  final GSStyle? style;
  final Clip clipBehavior;
  final AlignmentGeometry? transformAlignment;
  final Matrix4? transform;
  final Decoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final BlendMode? backgroundBlendMode;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;
  final DecorationImage? image;
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
    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSStyle(),
      inlineStyle: style,
    )!;

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
          color: styler.bg,
          borderRadius: BorderRadius.circular(
              style != null ? style!.borderRadius ?? 0 : 0),
          border: Border.all(
              color: style != null
                  ? style!.borderColor ?? Colors.transparent
                  : Colors.transparent,
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
