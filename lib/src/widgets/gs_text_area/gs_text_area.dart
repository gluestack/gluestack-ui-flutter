import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';

import 'package:gluestack_ui/src/widgets/gs_text_area/gs_text_area_style.dart';
enum GSTextAreaSizes {
$sm,
$md ,
$lg ,
$xl,
}
// TODO : Work on descendant styles (_input)
class GSTextArea extends StatefulWidget {
  final GSTextAreaSizes? size;
  final GSStyle? style;
  final bool? isDisabled;
  final bool? isInvalid;
  final bool? isReadOnly;
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
  final String? initialValue;
  //form prop
  final FormFieldValidator? validator;
  final FormFieldSetter? onSaved;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onFieldSubmitted;
  const GSTextArea(
      {super.key,
      this.size,
      this.isDisabled,
      this.isInvalid,
      this.isReadOnly,
      this.autocorrect = true,
      this.buildCounter,
      this.autofocus = false,
      this.isCollapsed = false,
      this.autofillHints,
      this.canRequestFocus = true,
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
      this.maxLines = 5,
      this.minLines,
      this.mouseCursor,
      this.obscureText = false,
      this.onAppPrivateCommand,
      this.onChanged,
      this.onEditingComplete,
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
      this.style,
      this.validator,
      this.onSaved,
      this.autovalidateMode,
      this.onFieldSubmitted,
      this.initialValue})
      ;

  @override
  State<GSTextArea> createState() => _GSTextAreaState();
}

class _GSTextAreaState extends State<GSTextArea> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final formProps = GSFormProvider.of(context);
    final bool isDisabled = widget.isDisabled ?? formProps?.isDisabled ?? false;
    final bool isReadOnly = widget.isReadOnly ?? formProps?.isReadOnly ?? false;
    final bool isInvalid = widget.isInvalid ?? formProps?.isInvalid ?? false;
    final bool isRequired = formProps?.isRequired ?? false;
    final inputSize =
        widget.size?.toGSSize ?? formProps?.size ?? textAreaStyle.props?.size;

    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        textAreaStyle,
        textAreaStyle.sizeMap(inputSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    Color? resolveBorderColor() {
      if (isInvalid) {
        return styler.onInvalid?.borderColor ?? styler.borderColor;
      }
      if (_isHovered) {
        return styler.onHover?.borderColor ?? styler.borderColor;
      }
      if (isDisabled) {
        return styler.onDisabled?.borderColor ?? styler.borderColor;
      }

      return styler.borderColor;
    }

    double? resolveBorderWidth() {
      if (isInvalid) {
        return styler.onInvalid?.borderWidth ?? styler.borderWidth;
      }
      if (_isHovered) {
        return styler.onHover?.borderWidth ?? styler.borderWidth;
      }
      if (isDisabled) {
        return styler.onDisabled?.borderWidth ?? styler.borderWidth;
      }

      return styler.borderWidth;
    }

    Color? resolveFocusBorderColor() {
      if (isInvalid) {
        return styler.onInvalid?.borderColor ?? styler.borderColor;
      }

      return styler.onFocus?.borderColor;
    }

    double? resolveFocusBorderWidth() {
      return styler.onFocus?.borderWidth ?? styler.borderWidth;
    }

    final borderColor = resolveBorderColor();
    final borderWidth = resolveBorderWidth();
    final focusedBorderColor = resolveFocusBorderColor();
    final focusedBorderWidth = resolveFocusBorderWidth();
    final borderStyle = OutlineInputBorder(
        borderSide: BorderSide(color: borderColor!, width: borderWidth!),
        borderRadius: BorderRadius.circular(styler.borderRadius!));
    final hintStyle =
        widget.hintStyle ?? styler.descendantStyles?['_input']?.textStyle;

    return FocusableActionDetector(
      onShowHoverHighlight: (value) {
        final shouldUpdateHover = !isDisabled && value;
        if (_isHovered != shouldUpdateHover) {
          setState(() => _isHovered = shouldUpdateHover);
        }
      },
      child: Opacity(
        opacity: isDisabled ? styler.onDisabled!.opacity! : 1,
        child: SizedBox(
          width: styler.width,
          height: styler.height,
          child: TextFormField(
            validator: (value) {
              if (isRequired && value != null && value.isEmpty) {
                return widget.errorText != null && widget.errorText!.isNotEmpty
                    ? widget.errorText
                    : 'This field cannot be empty!';
              }

              return widget.validator != null ? widget.validator!(value) : null;
            },
            onSaved: widget.onSaved,
            autovalidateMode: widget.autovalidateMode,
            initialValue: widget.initialValue,
            onFieldSubmitted: widget.onFieldSubmitted,
            autocorrect: widget.autocorrect,
            autofillHints: widget.autofillHints,
            autofocus: widget.autofocus,
            buildCounter: widget.buildCounter,
            canRequestFocus: widget.canRequestFocus,
            clipBehavior: widget.clipBehavior,
            contentInsertionConfiguration: widget.contentInsertionConfiguration,
            contextMenuBuilder: widget.contextMenuBuilder,
            controller: widget.controller,
            cursorColor: widget.cursorColor,
            cursorHeight: widget.cursorHeight,
            cursorOpacityAnimates: widget.cursorOpacityAnimates,
            cursorRadius: widget.cursorRadius,
            cursorWidth: widget.cursorWidth,
            dragStartBehavior: widget.dragStartBehavior,
            enabled: !isDisabled,
            readOnly: isReadOnly,
            enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            enableSuggestions: widget.enableSuggestions,
            expands: widget.expands,
            focusNode: widget.focusNode,
            inputFormatters: widget.inputFormatters,
            keyboardAppearance: widget.keyboardAppearance,
            keyboardType: widget.keyboardType,
            magnifierConfiguration: widget.magnifierConfiguration,
            maxLength: widget.maxLength,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            mouseCursor: isDisabled
                ? SystemMouseCursors.forbidden
                : _isHovered
                    ? SystemMouseCursors.text
                    : MouseCursor.defer,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            onAppPrivateCommand: widget.onAppPrivateCommand,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onTap: widget.onTap,
            onTapOutside: widget.onTapOutside,
            restorationId: widget.restorationId,
            scribbleEnabled: widget.scribbleEnabled,
            scrollController: widget.scrollController,
            scrollPadding: widget.scrollPadding,
            scrollPhysics: widget.scrollPhysics,
            selectionControls: widget.selectionControls,
            selectionHeightStyle: widget.selectionHeightStyle,
            selectionWidthStyle: widget.selectionWidthStyle,
            showCursor: widget.showCursor,
            smartDashesType: widget.smartDashesType,
            smartQuotesType: widget.smartQuotesType,
            spellCheckConfiguration: widget.spellCheckConfiguration,
            strutStyle: widget.strutStyle,
            style: widget.style?.textStyle ??
                TextStyle(
                    fontSize: styler
                        .descendantStyles?['_input']?.textStyle?.fontSize),
            textAlign: widget.textAlign,
            textAlignVertical: widget.textAlignVertical,
            textCapitalization: widget.textCapitalization,
            textDirection: widget.textDirection,
            textInputAction: widget.textInputAction,
            undoController: widget.undoController,
            decoration: InputDecoration(
              alignLabelWithHint: widget.alignLabelWithHint,
              constraints: widget.constraints,
              counter: widget.counter,
              counterStyle: widget.counterStyle,
              counterText: widget.counterText,
              fillColor: styler.color,
              filled: widget.style != null && widget.style!.color != null,
              disabledBorder: widget.disabledBorder ?? borderStyle,
              error: widget.error,
              errorBorder: widget.errorBorder,
              errorMaxLines: widget.errorMaxLines,
              errorStyle: widget.errorStyle,
              errorText: widget.errorText,
              floatingLabelAlignment: widget.floatingLabelAlignment,
              floatingLabelBehavior: widget.floatingLabelBehavior,
              floatingLabelStyle: widget.floatingLabelStyle,
              focusColor: widget.focusColor,
              focusedErrorBorder: widget.focusedErrorBorder,
              helperMaxLines: widget.helperMaxLines,
              helperStyle: widget.helperStyle,
              helperText: widget.helperText,
              hintMaxLines: widget.hintMaxLines,
              hintStyle: hintStyle,
              hintText: widget.hintText,
              hintTextDirection: widget.hintTextDirection,
              isCollapsed: widget.isCollapsed,
              isDense: widget.isDense,
              label: widget.label,
              labelStyle: widget.labelStyle,
              labelText: widget.labelText,
              semanticCounterText: widget.semanticCounterText,
              iconColor: widget.iconColor,
              hoverColor: widget.hoverColor,
              icon: widget.icon,
              prefix: widget.prefix,
              prefixIcon: widget.prefixIcon,
              prefixIconColor: widget.prefixIconColor,
              prefixIconConstraints: widget.prefixIconConstraints,
              prefixStyle: widget.prefixStyle,
              prefixText: widget.prefixText,
              suffix: widget.suffix,
              suffixIcon: widget.suffixIcon,
              suffixIconColor: widget.suffixIconColor,
              suffixIconConstraints: widget.suffixIconConstraints,
              suffixStyle: widget.suffixStyle,
              suffixText: widget.suffixText,
              enabledBorder: borderStyle,
              contentPadding: styler.padding,
              enabled: widget.visualFeedback,
              focusedBorder: borderStyle.copyWith(
                  borderSide: BorderSide(
                      // handle focusedBorderColor comming null
                      color: focusedBorderColor!,
                      width: focusedBorderWidth!)),
              border: borderStyle,
            ),
          ),
        ),
      ),
    );
  }
}
