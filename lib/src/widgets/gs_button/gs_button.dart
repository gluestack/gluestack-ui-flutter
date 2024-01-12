import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_group_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';

class GSButton extends StatefulWidget {
  final GSActions? action;
  final GSVariants? variant;
  final GSSizes? size;
  final bool? isDisabled;
  final bool? isFocusVisible;
  final Widget child;
  final VoidCallback onPressed;
  final GSStyle? style;
  final VoidCallback? onLongPress;
  final Function? onHover;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Clip clipBehavior;

  const GSButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.action = GSActions.primary,
    this.variant = GSVariants.solid,
    this.size = GSSizes.$md,
    this.isDisabled,
    this.isFocusVisible = false,
    this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autoFocus = false,
    this.clipBehavior = Clip.none,
  })  : assert(
          size == null ||
              size == GSSizes.$xs ||
              size == GSSizes.$sm ||
              size == GSSizes.$md ||
              size == GSSizes.$lg,
          'GS Button can only have the sizes: \$lg, \$md \$sm and \$xs\n'
          'To resolve this error, ensure only the above mentioned GSSizes is specified!',
        ),
        assert(
          variant == null ||
              variant == GSVariants.outline ||
              variant == GSVariants.solid ||
              variant == GSVariants.link,
          'GS Button can only have the vairants: solid, outline and link\n'
          'To resolve this error, ensure only the above mentioned GSVariants is specified.',
        ),
        assert(
          action == null ||
              action == GSActions.primary ||
              action == GSActions.secondary ||
              action == GSActions.positive ||
              action == GSActions.negative,
          'GS Button can only have the actions: primary, secondary, positive and negative\n'
          'To resolve this error, ensure only the above mentioned GSActions is specified.',
        );

  @override
  State<GSButton> createState() => _GSButtonState();
}

class _GSButtonState extends State<GSButton> {
  //Work around
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final value = GSButtonGroupProvider.of(context);
    final buttonAction = widget.action ?? buttonStyle.props?.action;
    final buttonVariant = widget.variant ?? buttonStyle.props?.variant;
    final buttonSize = widget.size ?? value?.size ?? buttonStyle.props?.size;
    final disabled = widget.isDisabled ?? value?.isDisabled ?? false;
    final focused = widget.isFocusVisible ?? false;
    final isAttached = value?.isAttached ?? false;
    if (isHovered && widget.onHover != null) {
      widget.onHover!();
    }

    return GSStyleBuilder(
      isDisabled: disabled,
      isFocused: focused,
      child: Builder(builder: (context) {
        GSStyle styler = resolveStyles(
            context: context,
            styles: [
              buttonStyle,
              buttonStyle.actionMap(buttonAction),
              buttonStyle.variantMap(buttonVariant),
              buttonStyle.sizeMap(buttonSize),
              buttonStyle.compoundVariants?[
                  widget.action.toString() + widget.variant.toString()]
            ],
            inlineStyle: widget.style,
            isFirst: true);

        return GSAncestor(
          decedentStyles: styler.descendantStyles,
          child: GSButtonProvider(
            action: buttonAction!,
            variant: buttonVariant!,
            size: buttonSize!,
            child: Opacity(
              opacity: disabled ? styler.opacity ?? 0.5 : 1,
              child: SizedBox(
                height: styler.height,
                child: MouseRegion(
                  onEnter: (PointerEvent x) {
                    setState(() {
                      isHovered = true;
                    });
                  },
                  onExit: (PointerEvent x) {
                    setState(() {
                      isHovered = false;
                    });
                  },
                  child: FocusableActionDetector(
                    onFocusChange: widget.onFocusChange,
                    focusNode: widget.focusNode,
                    autofocus: widget.autoFocus,
                    child: GestureDetector(
                      onTap: disabled ? null : widget.onPressed,
                      onLongPress: disabled ? null : widget.onLongPress,
                      child: Container(
                        clipBehavior: widget.clipBehavior,
                        // statesController: statesController,
                        padding: styler.padding,
                        decoration: BoxDecoration(
                          color: styler.bg,
                          borderRadius:
                              BorderRadius.circular(styler.borderRadius ?? 0.0),
                          border: Border.fromBorderSide(_resolveBorderSide(
                              buttonVariant, styler, isAttached)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            widget.child,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  BorderSide _resolveBorderSide(
      GSVariants variant, GSStyle styler, bool isAttached) {
    if (isAttached) {
      return BorderSide.none;
    }
    if (variant == GSVariants.link) {
      return BorderSide.none;
    }
    if (widget.isFocusVisible!) {
      return BorderSide(color: $GSColors.primary500, width: 2.0);
    }
    return styler.borderWidth != null || styler.outlineWidth != null
        ? BorderSide(
            color: styler.borderColor ??
                styler.outlineColor ??
                const Color.fromARGB(0, 0, 0, 0),
            width: styler.borderWidth ?? styler.outlineWidth ?? 0.0)
        : BorderSide.none;
  }
}
