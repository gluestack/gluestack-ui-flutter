import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_content.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_content_style.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_style.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSAlertDialogSizes {
  $full,
  $lg,
  $md,
  $sm,
  $xs,
}

///
/// Gluestack Alert Dialog.
///
class GSAlertDialog extends StatefulWidget {
  final GSAlertDialogContent content;
  final GSAlertDialogSizes? size;
  final GSStyle? style;
  final AlignmentGeometry? alignment;
  final Clip? clipBehavior;
  final EdgeInsets? insetPadding;
  final double? elevation;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Curve? insetAnimationCurve;
  final Duration? insetAnimationDuration;

  const GSAlertDialog({
    super.key,
    required this.content,
    this.style,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.insetPadding =
        const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
    this.elevation,
    this.backgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.insetAnimationCurve = Curves.decelerate,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.size,
  });
  static void show(
    BuildContext context, {
    GSAlertDialogContent? content,
    bool? showBackdrop = true,
    GSStyle? style,
    final AlignmentGeometry? alignment,
    final Clip? clipBehavior = Clip.none,
    final EdgeInsets? insetPadding =
        const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
    final double? elevation,
    final Color? backgroundColor,
    final Color? shadowColor,
    final Color? surfaceTintColor,
    final ShapeBorder? shape,
    final Curve? insetAnimationCurve = Curves.decelerate,
    final Duration? insetAnimationDuration = const Duration(milliseconds: 100),
    final GSAlertDialogSizes? size,
  }) {
    showDialog(
      barrierColor:
          !showBackdrop! ? Colors.transparent : Colors.black.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) {
        return GSAlertDialog(
          content: content ?? const GSAlertDialogContent(),
          style: style,
          alignment: alignment,
          backgroundColor: backgroundColor,
          clipBehavior: clipBehavior,
          elevation: elevation,
          insetAnimationCurve: insetAnimationCurve,
          insetAnimationDuration: insetAnimationDuration,
          insetPadding: insetPadding,
          shadowColor: shadowColor,
          shape: shape,
          surfaceTintColor: surfaceTintColor,
          size: size,
        );
      },
    );
  }

  @override
  State<GSAlertDialog> createState() => _GSAlertDialogState();
}

class _GSAlertDialogState extends State<GSAlertDialog> {
  @override
  Widget build(BuildContext context) {
    final alertSize = widget.size?.toGSSize ?? alertDialogStyle.props?.size;
    GSStyle styler = resolveStyles(
      context: context,
      styles: [alertDialogStyle, alertDialogStyle.sizeMap(alertSize)],
      inlineStyle: widget.style,
      isFirst: true,
    );
    final alertWidth = styler.width ??
        (MediaQuery.sizeOf(context).width *
            (styler
                    .descendantStyles?[
                        gsAlertDialogContentConfig.ancestorStyle.first]
                    ?.width)!
                .toDouble());
    final alertMaxWidth = styler
            .descendantStyles?[gsAlertDialogContentConfig.ancestorStyle.first]
            ?.maxWidth ??
        double.infinity;

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: Dialog(
        backgroundColor: widget.backgroundColor ?? styler.bg,
        alignment: widget.alignment,
        clipBehavior: widget.clipBehavior!,
        elevation: widget.elevation,
        insetPadding: widget.insetPadding!,
        shadowColor: widget.shadowColor,
        shape: widget.shape,
        surfaceTintColor: widget.surfaceTintColor,
        insetAnimationCurve: widget.insetAnimationCurve!,
        insetAnimationDuration: widget.insetAnimationDuration!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(styler.borderRadius ?? 4.0),
          child: Container(
            width: alertWidth,
            height: styler.height,
            constraints: BoxConstraints(maxWidth: alertMaxWidth),
            child: widget.content,
          ),
        ),
      ),
    );
  }
}
