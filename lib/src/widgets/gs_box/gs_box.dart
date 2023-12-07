import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
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
    final styler = resolveStyles(context, inlineStyle: style);
    return Visibility(
      visible: styler?.visibility ?? false,
      child: Container(
        clipBehavior: clipBehavior,
        transform: transform,
        transformAlignment: transformAlignment,
        foregroundDecoration: foregroundDecoration,
        // alignment: styler != null
        //     ? styler!.alignment ?? Alignment.center
        //     : Alignment.center,
        padding: styler != null
            ? styler!.padding ??
                const EdgeInsets.symmetric(vertical: 0, horizontal: 0)
            : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        height: styler != null ? styler!.height : null,
        width: styler != null ? styler!.width : null,
        constraints: BoxConstraints(
          minWidth: styler != null ? styler!.width ?? 0 : 0,
          minHeight: styler != null ? styler!.height ?? 0 : 0,
        ),
        // margin: styler != null
        //     ? styler!.margin ??
        //         const EdgeInsets.symmetric(vertical: 0, horizontal: 0)
        //     : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        decoration: BoxDecoration(
          color: styler != null
              ? styler!.color ?? Colors.transparent
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
              styler != null ? styler!.borderRadius ?? 0 : 0),
          border: Border.all(
              color: styler != null
                  ? styler!.borderColor ?? Colors.transparent
                  : Colors.transparent,
              width: styler != null ? styler!.borderWidth ?? 0 : 0),
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          boxShadow: boxShadow,
          image: image,
          shape: shape,
        ),
        child: child,
      ),
    );
  }
}
