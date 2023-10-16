import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';

import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_attributes.dart';

import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';
import 'package:provider/provider.dart';

class GSInput extends StatelessWidget {
  final GSInputVariant variant;
  final GSInputSize size;
  final StyleData? style;
  final bool readOnly;
  final bool enabled;
  final bool vaild;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final bool canRequestFocus;
  final Clip clipBehavior;
  final bool? cursorOpacityAnimates;
  final Radius? cursorRadius;
  final double cursorWidth;
  final DragStartBehavior dragStartBehavior;
  final bool enableIMEPersonalizedLearning;
  final bool? enableInteractiveSelection;
  final bool enableSuggestions;
  final bool expands;
  final TextInputType? keyboardType;
  final SmartDashesType? smartDashesType;
  final FocusNode? focusNode;
  final EdgeInsets scrollPadding;
  final Brightness? keyboardAppearance;
  final List<TextInputFormatter>? inputFormatters;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final TextCapitalization textCapitalization;
  final Color? focusColor;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool? showCursor;
  final MouseCursor? mouseCursor;
  final ScrollController? scrollController;
  final bool obscureText;
  final InputBorder? focusedErrorBorder;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final TextSelectionControls? selectionControls;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final SmartQuotesType? smartQuotesType;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final StrutStyle? strutStyle;
  final String? helperText;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final String? restorationId;
  final bool scribbleEnabled;
  final String obscuringCharacter;
  final Color? cursorColor;
  final double? cursorHeight;
  final TextAlign textAlign;
  final ScrollPhysics? scrollPhysics;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;
  final UndoHistoryController? undoController;
  //decoration
  final bool? alignLabelWithHint;
  final BoxConstraints? constraints;
  final Widget? counter;
  final Color? iconColor;
  final TextStyle? counterStyle;
  final String? counterText;
  final InputBorder? disabledBorder;
  final Widget? error;
  final InputBorder? errorBorder;
  final int? errorMaxLines;
  final TextStyle? errorStyle;
  final String? errorText;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? floatingLabelStyle;
  final int? helperMaxLines;
  final TextStyle? helperStyle;
  final int? hintMaxLines;
  final TextStyle? hintStyle;
  final String? hintText;
  final TextDirection? hintTextDirection;
  final bool isCollapsed;
  final bool? isDense;
  final Widget? label;
  final TextStyle? labelStyle;
  final String? labelText;
  final String? semanticCounterText;
  final Color? hoverColor;
  final Widget? icon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final BoxConstraints? prefixIconConstraints;
  final TextStyle? prefixStyle;
  final String? prefixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final BoxConstraints? suffixIconConstraints;
  final TextStyle? suffixStyle;
  final String? suffixText;
  final bool visualFeedback;
  const GSInput(
      {super.key,
      this.variant = GSInputVariant.outline,
      this.size = GSInputSize.md,
      this.readOnly = false,
      this.enabled = true,
      this.vaild = true,
      this.autocorrect = true,
      this.buildCounter,
      this.autofocus = false,
      this.isCollapsed = false,
      this.autofillHints,
      this.canRequestFocus = false,
      this.clipBehavior = Clip.hardEdge,
      this.enableIMEPersonalizedLearning = true,
      this.enableSuggestions = true,
      this.expands = false,
      this.scribbleEnabled = true,
      this.cursorWidth = 2.0,
      this.dragStartBehavior = DragStartBehavior.start,
      this.obscuringCharacter = '•',
      this.controller,
      this.maxLength,
      this.contextMenuBuilder,
      this.contentInsertionConfiguration,
      this.cursorHeight,
      this.cursorColor,
      this.cursorOpacityAnimates,
      this.cursorRadius,
      this.enableInteractiveSelection,
      this.keyboardAppearance,
      this.focusNode,
      this.inputFormatters,
      this.keyboardType,
      this.maxLengthEnforcement,
      this.magnifierConfiguration,
      this.maxLines = 1,
      this.minLines,
      this.mouseCursor,
      this.obscureText = false,
      this.onAppPrivateCommand,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.onTap,
      this.onTapOutside,
      this.restorationId,
      this.scrollController,
      this.scrollPhysics,
      this.selectionWidthStyle = ui.BoxWidthStyle.tight,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.selectionHeightStyle = ui.BoxHeightStyle.tight,
      this.textCapitalization = TextCapitalization.none,
      this.textAlign = TextAlign.start,
      this.selectionControls,
      this.showCursor,
      this.smartDashesType,
      this.smartQuotesType,
      this.spellCheckConfiguration,
      this.strutStyle,
      this.textAlignVertical,
      this.textDirection,
      this.textInputAction,
      this.undoController,
      this.alignLabelWithHint,
      this.constraints,
      this.counter,
      this.counterStyle,
      this.counterText,
      this.disabledBorder,
      this.error,
      this.errorBorder,
      this.errorMaxLines,
      this.errorStyle,
      this.errorText,
      this.floatingLabelAlignment,
      this.floatingLabelBehavior,
      this.floatingLabelStyle,
      this.focusColor,
      this.focusedErrorBorder,
      this.helperMaxLines,
      this.helperStyle,
      this.helperText,
      this.hintMaxLines,
      this.hintStyle,
      this.hintText,
      this.hintTextDirection,
      this.isDense,
      this.label,
      this.labelStyle,
      this.labelText,
      this.semanticCounterText,
      this.iconColor,
      this.hoverColor,
      this.icon,
      this.prefix,
      this.prefixIcon,
      this.prefixIconColor,
      this.prefixIconConstraints,
      this.prefixStyle,
      this.prefixText,
      this.suffix,
      this.suffixIcon,
      this.suffixIconColor,
      this.suffixIconConstraints,
      this.suffixStyle,
      this.suffixText,
      this.visualFeedback = true,
      this.style});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    final gsInputStyle = GSInputAttributes.gsInputCombination[variant]![theme];
    final borderWidth = style?.borderWidth ?? 1.0;
    final borderColor = !vaild
        ? $GSColors.error700
        : style?.borderColor ?? gsInputStyle?.borderColor!;
    final borderStyle = gsInputStyle?.border != null
        ? gsInputStyle?.border?.copyWith(
            borderRadius: style?.borderRadius != null
                ? BorderRadius.circular(style!.borderRadius!)
                : variant != GSInputVariant.outline
                    ? GSInputAttributes.inputBorderRadius[size]
                    : null,
            borderSide: BorderSide(color: borderColor!, width: borderWidth))
        : UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor!, width: borderWidth));

    return SizedBox(
        width: style?.width,
        height: style?.height ?? GSInputAttributes.inputSize[size],
        child: TextField(
          autocorrect: autocorrect,
          autofillHints: autofillHints,
          autofocus: autofocus,
          buildCounter: buildCounter,
          canRequestFocus: canRequestFocus,
          clipBehavior: clipBehavior,
          contentInsertionConfiguration: contentInsertionConfiguration,
          contextMenuBuilder: contextMenuBuilder,
          controller: controller,
          cursorColor: cursorColor,
          cursorHeight: cursorHeight,
          cursorOpacityAnimates: cursorOpacityAnimates,
          cursorRadius: cursorRadius,
          cursorWidth: cursorWidth,
          dragStartBehavior: dragStartBehavior,
          enabled: enabled,
          readOnly: readOnly,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          enableInteractiveSelection: enableInteractiveSelection,
          enableSuggestions: enableSuggestions,
          expands: expands,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          key: key,
          keyboardAppearance: keyboardAppearance,
          keyboardType: keyboardType,
          magnifierConfiguration: magnifierConfiguration,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          mouseCursor: mouseCursor,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          onAppPrivateCommand: onAppPrivateCommand,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          onTap: onTap,
          onTapOutside: onTapOutside,
          restorationId: restorationId,
          scribbleEnabled: scribbleEnabled,
          scrollController: scrollController,
          scrollPadding: scrollPadding,
          scrollPhysics: scrollPhysics,
          selectionControls: selectionControls,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          showCursor: showCursor,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          spellCheckConfiguration: spellCheckConfiguration,
          strutStyle: strutStyle,
          style: style?.textStyle ??
              TextStyle(fontSize: GSInputAttributes.inputFontSize[size]),
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          textCapitalization: textCapitalization,
          textDirection: textDirection,
          textInputAction: textInputAction,
          undoController: undoController,
          decoration: InputDecoration(
              alignLabelWithHint: alignLabelWithHint,
              constraints: constraints,
              counter: counter,
              counterStyle: counterStyle,
              counterText: counterText,
              fillColor: style?.color,
              filled: style != null && style!.color != null,
              disabledBorder: disabledBorder,
              // error: error,
              errorBorder: errorBorder,
              errorMaxLines: errorMaxLines,
              errorStyle: errorStyle,
              errorText: errorText,
              floatingLabelAlignment: floatingLabelAlignment,
              floatingLabelBehavior: floatingLabelBehavior,
              floatingLabelStyle: floatingLabelStyle,
              focusColor: focusColor,
              focusedErrorBorder: focusedErrorBorder,
              helperMaxLines: helperMaxLines,
              helperStyle: helperStyle,
              helperText: helperText,
              hintMaxLines: hintMaxLines,
              hintStyle: hintStyle,
              hintText: hintText,
              hintTextDirection: hintTextDirection,
              isCollapsed: isCollapsed,
              isDense: isDense,
              label: label,
              labelStyle: labelStyle,
              labelText: labelText,
              semanticCounterText: semanticCounterText,
              iconColor: iconColor,
              hoverColor: hoverColor,
              icon: icon,
              prefix: prefix,
              prefixIcon: prefixIcon,
              prefixIconColor: prefixIconColor,
              prefixIconConstraints: prefixIconConstraints,
              prefixStyle: prefixStyle,
              prefixText: prefixText,
              suffix: suffix,
              suffixIcon: suffixIcon,
              suffixIconColor: suffixIconColor,
              suffixIconConstraints: suffixIconConstraints,
              suffixStyle: suffixStyle,
              suffixText: suffixText,
              enabledBorder: borderStyle,
              contentPadding: style?.padding ?? gsInputStyle?.px,
              enabled: visualFeedback,
              focusedBorder: borderStyle?.copyWith(
                  borderSide: BorderSide(
                      color: !vaild
                          ? $GSColors.error700
                          : gsInputStyle!.focusborderColor!,
                      width: borderWidth)),
              border: borderStyle),
        ));
  }
}
