import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

class GSHeader extends StatelessWidget {
  final Widget? child;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final bool automaticallyImplyLeading;
  final bool centerChild;
  final EdgeInsets? minPaddingForLeading;
  final EdgeInsets? minPaddingForTrailing;
  final double? minSpacingForChild;
  final double? minHeight;
  final GSStyle? style;
  final List<BoxShadow>? boxShadow;
  const GSHeader({
    super.key,
    this.child,
    this.leadingWidget,
    this.trailingWidget,
    this.automaticallyImplyLeading = true,
    this.minHeight = 45,
    this.centerChild = false,
    this.minPaddingForLeading = const EdgeInsets.only(left: 4, right: 4),
    this.minSpacingForChild,
    this.minPaddingForTrailing = const EdgeInsets.only(right: 4, left: 4),
    this.style,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    final styler = resolveStyles(
      context: context,
      styles: [
        GSStyle(
          width: double.infinity,
          height: minHeight,
          bg: $GSColors.primary500,
        ),
      ],
      inlineStyle: style,
      isFirst: true,
    );

    bool isLightColor(Color? color) {
      if (color == null) return true;
      // WCAG formula
      final luminance =
          0.2126 * color.red + 0.7152 * color.green + 0.0722 * color.blue;
      return luminance > 0.5;
    }

    Widget? leading = leadingWidget;

    if (leading == null && automaticallyImplyLeading) {
      if (parentRoute?.impliesAppBarDismissal ?? false) {
        leading = GSButton(
          variant: GSButtonVariants.link,
          child: GSIcon(
            icon: const IconData(
              0xf570,
              fontFamily: 'MaterialIcons',
              matchTextDirection: true,
            ),
            style: GSStyle(
                color: isLightColor(styler.bg)
                    ? $GSColors.black
                    : $GSColors.white),
          ),
          onPressed: () => Navigator.maybePop(context),
        );
      }
    }

    Widget? trailing;
    if (trailingWidget != null && trailingWidget is Row ||
        trailingWidget is GSHStack) {
      trailing = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: trailingWidget is GSHStack
            ? (trailingWidget! as GSHStack).children
            : trailingWidget is Row
                ? (trailingWidget! as Row).children
                : [trailingWidget ?? const SizedBox()],
      );
    }
    //fix for single trail widget
    if (trailing == null && trailingWidget != null) {
      trailing = Row(
        mainAxisSize: MainAxisSize.min,
        children: [trailingWidget!],
      );
    }

    return GSBox(
        style: styler,
        boxShadow: boxShadow,
        child: NavigationToolbar(
          leading: Padding(padding: minPaddingForLeading!, child: leading),
          middle: child,
          trailing: Padding(padding: minPaddingForTrailing!, child: trailing),
          centerMiddle: centerChild,
          middleSpacing: minSpacingForChild ?? NavigationToolbar.kMiddleSpacing,
        ));
  }
}
