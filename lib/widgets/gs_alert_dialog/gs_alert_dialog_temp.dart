import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_content.dart';

// This file will be discared later
class GSAlertDialogTemp extends StatefulWidget {
  final GSAlertDialogContent gsAlertDialogContent;
  final GSStyle? style;
  final Widget? title;
  final List<Widget>? actions;
  final MainAxisAlignment? actionsAlignment;
  final OverflowBarAlignment? actionsOverflowAlignment;
  final double? actionsOverflowButtonSpacing;
  final VerticalDirection? actionsOverflowDirection;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? buttonPadding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final double? elevation;
  final Widget? icon;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final EdgeInsets? insetPadding;
  final bool? scrollable;
  final String? semanticLabel;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  const GSAlertDialogTemp(
      {super.key,
      required this.gsAlertDialogContent,
      this.style,
      this.actionsAlignment,
      this.actionsOverflowAlignment,
      this.actionsOverflowButtonSpacing,
      this.actionsOverflowDirection,
      this.actionsPadding,
      this.buttonPadding,
      this.alignment,
      this.backgroundColor,
      this.clipBehavior = Clip.none,
      this.contentPadding,
      this.contentTextStyle,
      this.elevation,
      this.icon,
      this.iconColor,
      this.iconPadding,
      this.insetPadding =
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      this.scrollable = false,
      this.semanticLabel,
      this.shadowColor,
      this.shape,
      this.surfaceTintColor,
      this.titlePadding,
      this.titleTextStyle,
      this.title,
      this.actions});
  static void show(
    BuildContext context, {
    GSAlertDialogContent? gsAlertDialogContent,
    bool? showBackdrop = true,
    GSStyle? style,
    Widget? title,
    List<Widget>? actions,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    double? actionsOverflowButtonSpacing,
    VerticalDirection? actionsOverflowDirection,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? buttonPadding,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
    Clip? clipBehavior = Clip.none,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    double? elevation,
    Widget? icon,
    Color? iconColor,
    EdgeInsetsGeometry? iconPadding,
    EdgeInsets? insetPadding =
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    bool? scrollable = false,
    String? semanticLabel,
    Color? shadowColor,
    ShapeBorder? shape,
    Color? surfaceTintColor,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
  }) {
    showDialog(
      barrierColor:
          !showBackdrop! ? Colors.transparent : Colors.black.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) {
        return GSAlertDialogTemp(
          gsAlertDialogContent:
              gsAlertDialogContent ?? const GSAlertDialogContent(),
          style: style,
          actionsAlignment: actionsAlignment,
          actions: actions,
          actionsOverflowAlignment: actionsOverflowAlignment,
          actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          actionsOverflowDirection: actionsOverflowDirection,
          actionsPadding: actionsPadding,
          alignment: alignment,
          backgroundColor: backgroundColor,
          buttonPadding: buttonPadding,
          clipBehavior: clipBehavior,
          contentPadding: contentPadding,
          contentTextStyle: contentTextStyle,
          elevation: elevation,
          icon: icon,
          iconColor: iconColor,
          iconPadding: iconPadding,
          insetPadding: insetPadding,
          scrollable: scrollable,
          semanticLabel: semanticLabel,
          shadowColor: shadowColor,
          shape: shape,
          surfaceTintColor: surfaceTintColor,
          title: title,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
        );
      },
    );
  }

  @override
  State<GSAlertDialogTemp> createState() => _GSAlertDialogState();
}

class _GSAlertDialogState extends State<GSAlertDialogTemp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title,
      content: widget.gsAlertDialogContent,
      actions: widget.actions,
      titlePadding: widget.titlePadding ?? widget.style?.padding,
      titleTextStyle: widget.titleTextStyle ?? widget.style?.textStyle,
      // TODO : Add default padding.
      contentPadding: widget.contentPadding ??
          widget.style?.padding ??
          const EdgeInsets.all(0),
      contentTextStyle: widget.contentTextStyle ?? widget.style?.textStyle,
      actionsPadding: widget.actionsPadding ?? widget.style?.padding,
      backgroundColor: widget.backgroundColor ?? widget.style?.bg,
      actionsAlignment: widget.actionsAlignment,
      actionsOverflowAlignment: widget.actionsOverflowAlignment,
      actionsOverflowButtonSpacing: widget.actionsOverflowButtonSpacing,
      actionsOverflowDirection: widget.actionsOverflowDirection,
      alignment: widget.alignment,
      buttonPadding: widget.buttonPadding,
      clipBehavior: widget.clipBehavior!,
      elevation: widget.elevation,
      icon: widget.icon,
      iconColor: widget.iconColor,
      iconPadding: widget.iconPadding,
      insetPadding: widget.insetPadding!,
      scrollable: widget.scrollable!,
      semanticLabel: widget.semanticLabel,
      shadowColor: widget.shadowColor,
      shape: widget.shape,
      surfaceTintColor: widget.surfaceTintColor,
    );
  }
}
