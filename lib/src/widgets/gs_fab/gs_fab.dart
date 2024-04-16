import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

///
/// Gluestack Floating Action Button.
///
class GSFab extends StatelessWidget {
  final GSFABSizes? size;
  final GSFABPlacements? placement;
  final Widget? label;
  final GlueStyle? style;
  final Widget? icon;
  final bool isDisabled;
  final bool isPressed;
  final bool isHovered;
  final void Function()? onPressed;
  final VoidCallback? onLongPress;
  const GSFab({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.size,
    this.label,
    this.icon,
    this.placement,
    this.style,
    this.isHovered = false,
    this.isPressed = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final fabSize = size?.toGSSize ?? fabStyle.props!.size!;
    final fabPlacement = placement?.toGSPlacement ?? fabStyle.props?.placement!;
    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        fabStyle,
        fabStyle.sizeMap(fabSize),
        fabStyle.placementMap(fabPlacement),
      ],
      inlineStyle: style,
      isFirst: true,
    );

    final bool isCentered = fabPlacement == GSPlacements.bottomCenter ||
        fabPlacement == GSPlacements.topCenter;

    final fabStyler = isPressed
        ? styler.merge(styler.onActive)
        : !isHovered
            ? styler
            : styler.merge(styler.onHover);

    final widget = GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: Opacity(
        opacity: isDisabled ? styler.onDisabled?.opacity ?? 0.0 : 1,
        child: GSButton(
          isDisabled: isDisabled,
          style: GlueStyle.fromGSStyle(fabStyler, context),
          onPressed: onPressed ?? () {},
          onLongPress: isDisabled ? null : onLongPress,
          child: resolveFlexWidget(
            flexDirection: styler.flexDirection,
            mainAxisAlignment: styler.justifyContent,
            crossAxisAlignment: styler.alignItems,
            children: [if (icon != null) icon!, if (label != null) label!],
          ),
        ),
      ),
    );

    return Positioned.fill(
        bottom: styler.bottom,
        top: styler.top,
        left: isCentered ? styler.left ?? 0.0 : styler.left,
        right: isCentered ? styler.right ?? 0.0 : styler.right,
        child: isCentered
            ? Align(
                alignment: Alignment.center,
                child: widget,
              )
            : widget);
  }
}
