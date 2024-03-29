import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    Widget? leading = leadingWidget;

    if (leading == null && automaticallyImplyLeading) {
      if (parentRoute?.impliesAppBarDismissal ?? false) {
        leading = GSButton(
          variant: GSButtonVariants.link,
          child: const GSIcon(
              icon: IconData(0xf570,
                  fontFamily: 'MaterialIcons', matchTextDirection: true)),
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
                : [trailingWidget ?? const SizedBox.shrink()],
      );
    }

    return GSBox(
        style: GSStyle(
          width: double.infinity,
          height: minHeight,
          color: style?.color ?? style?.bg ?? $GSColors.primary400,
        ),
        child: NavigationToolbar(
          leading: Padding(padding: minPaddingForLeading!, child: leading),
          middle: child,
          trailing: Padding(padding: minPaddingForTrailing!, child: trailing),
          centerMiddle: centerChild,
          middleSpacing: minSpacingForChild ?? NavigationToolbar.kMiddleSpacing,
        ));
  }
}
