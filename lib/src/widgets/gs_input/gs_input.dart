import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_input/gs_input_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_text/gs_text_style.dart';

enum GSInputVariants {
  outline,
  rounded,
  underlined,
}

enum GSInputSizes {
  $sm,
  $md,
  $lg,
  $xl,
}

class GSInput extends StatefulWidget {
  final GSInputVariants? variant;
  final GSInputSizes? size;
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
  //final InputBorder? focusedErrorBorder;
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
  final ValueChanged<String>? onFieldSubmitted;
  final BoxConstraints? constraints;
  final TextStyle? hintStyle;
  final String? hintText;
  final TextStyle? prefixStyle;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hoverColor;
  final Color? textSelectionColor;
  const GSInput({
    super.key,
    this.variant = GSInputVariants.outline,
    this.size,
    this.isDisabled,
    this.isInvalid,
    this.isReadOnly,
    this.autocorrect = true,
    this.buildCounter,
    this.autofocus = false,
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
    this.maxLines = 1,
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
    this.constraints,
    this.focusColor,
    this.helperText,
    this.hintStyle,
    this.hintText,
    this.hoverColor,
    this.style,
    this.onFieldSubmitted,
    this.prefixStyle,
    this.prefixText,
    this.prefixIcon,
    this.suffixIcon,
    this.textSelectionColor,
  });

  @override
  State<GSInput> createState() => _GSInputState();
}

class _GSInputState extends State<GSInput> {
  bool _isHovered = false;

  final focusNode = FocusNode();
  bool isFocused = false;
  late final TextEditingController? controller;

  @override
  void initState() {
    if (widget.controller == null) {
      controller = TextEditingController();
    }

    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formProps = GSFormProvider.of(context);
    final inputVariant =
        widget.variant?.toGSVariant ?? inputStyle.props?.variant;
    final inputSize = widget.size?.toGSSize ??
        formProps?.size ??
        inputStyle.props?.size ??
        GSSizes.$md;
    final bool isDisabled = widget.isDisabled ?? formProps?.isDisabled ?? false;
    final bool isReadOnly = widget.isReadOnly ?? formProps?.isReadOnly ?? false;
    final bool isInvalid = widget.isInvalid ?? formProps?.isInvalid ?? false;
    // final bool isRequired = formProps?.isRequired ?? false;

    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        gstextStyle,
        inputStyle,
        inputStyle.variantMap(inputVariant),
        inputStyle.sizeMap(inputSize)
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    Color? resolveBorderColor() {
      if (isInvalid) {
        if (inputVariant == GSVariants.underlined) {
          return styler.onInvalid?.borderBottomColor;
        }
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
      if (inputVariant == GSVariants.underlined) {
        if (isInvalid) {
          return styler.onInvalid?.borderBottomWidth ??
              styler.borderBottomWidth;
        }
        if (_isHovered) {
          return styler.onHover?.borderBottomWidth ?? styler.borderBottomWidth;
        }
        if (isDisabled) {
          return styler.onDisabled?.borderBottomWidth ??
              styler.borderBottomWidth;
        }
        return styler.borderBottomWidth;
      }
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
        if (inputVariant == GSVariants.underlined) {
          return styler.onInvalid?.borderBottomColor;
        }
        return styler.onInvalid?.borderColor ?? styler.borderColor;
      }

      return styler.onFocus?.borderColor;
    }

    // double? resolveFocusBorderWidth() {
    //   if (inputVariant == GSVariants.underlined) {
    //     return styler.onFocus?.borderBottomWidth ?? styler.borderBottomWidth;
    //   }

    //   return styler.onFocus?.borderWidth ?? styler.borderWidth;
    // }

    final borderColor = resolveBorderColor();
    final borderWidth = resolveBorderWidth();
    final focusedBorderColor = resolveFocusBorderColor();
    // final focusedBorderWidth = resolveFocusBorderWidth();
    return FocusableActionDetector(
        onShowHoverHighlight: (value) {
          const shouldUpdateHover = true;
          if (_isHovered != shouldUpdateHover) {
            setState(() => _isHovered = shouldUpdateHover);
          }
        },
        mouseCursor:
            isDisabled ? SystemMouseCursors.forbidden : MouseCursor.defer,
        child: Opacity(
          opacity: isDisabled ? styler.onDisabled?.opacity ?? 0.5 : 1,
          child: SizedBox(
            width: styler.width,
            height: styler.height,
            child: GsGestureDetector(
              showFocusHighlight: false,
              onPressed: widget.onTap,
              onDoubleTap: () {
                if (widget.controller!.text.isNotEmpty) {
                  widget.controller!.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: widget.controller!.text.length);
                }
              },
              child: Stack(
                children: [
                  if (widget.controller?.text.isEmpty ??
                      controller!.text.isEmpty)
                    Positioned(
                      left: widget.prefixText != null &&
                              widget.prefixText!.isNotEmpty
                          ? 10 + widget.prefixText!.length * 8
                          : widget.prefixIcon != null
                              ? 50
                              : 10,
                      top: 10,
                      child: Text(widget.hintText!,
                          style: widget.hintStyle ??
                              TextStyle(
                                  color: borderColor,
                                  fontSize: styler.textStyle?.fontSize)),
                    ),
                  Container(
                    padding: styler.padding ??
                        const EdgeInsets.symmetric(horizontal: 15),
                    constraints: widget.constraints,
                    decoration: BoxDecoration(
                      border: widget.variant == GSInputVariants.underlined
                          ? Border(
                              bottom: BorderSide(
                                color: isFocused && !isDisabled
                                    ? widget.hoverColor ??
                                        focusedBorderColor ??
                                        const Color(0xFF2196F3)
                                    : borderColor!,
                                width: borderWidth!,
                              ),
                            )
                          : Border.all(
                              color: isFocused && !isDisabled
                                  ? widget.hoverColor ??
                                      focusedBorderColor ??
                                      const Color(0xFF2196F3)
                                  : borderColor!,
                              width: borderWidth!),
                      color: styler.bg,
                      borderRadius:
                          BorderRadius.circular(styler.borderRadius ?? 0.0),
                    ),
                    child: Row(
                      children: [
                        _buildPrefixText(),
                        _buildPrefixIcon(),
                        Expanded(
                          child: Center(
                            child: EditableText(
                              onSubmitted: widget.onFieldSubmitted,
                              autocorrect: widget.autocorrect,
                              autofocus: widget.autofocus,
                              selectionColor: widget.textSelectionColor ??
                                  const Color.fromRGBO(200, 200, 200, 1.0),
                              clipBehavior: widget.clipBehavior,
                              contentInsertionConfiguration:
                                  widget.contentInsertionConfiguration,
                              contextMenuBuilder: widget.contextMenuBuilder,
                              controller: widget.controller ?? controller!,
                              cursorColor: widget.cursorColor ?? borderColor!,
                              cursorHeight: widget.cursorHeight,
                              cursorOpacityAnimates:
                                  widget.cursorOpacityAnimates ?? false,
                              cursorRadius: widget.cursorRadius,
                              cursorWidth: widget.cursorWidth,
                              dragStartBehavior: widget.dragStartBehavior,
                              readOnly: isReadOnly || isDisabled,
                              enableIMEPersonalizedLearning:
                                  widget.enableIMEPersonalizedLearning,
                              enableInteractiveSelection:
                                  widget.enableInteractiveSelection,
                              enableSuggestions: widget.enableSuggestions,
                              expands: widget.expands,
                              focusNode: widget.focusNode ?? focusNode,
                              inputFormatters: widget.inputFormatters,
                              keyboardAppearance:
                                  widget.keyboardAppearance ?? Brightness.light,
                              keyboardType: widget.keyboardType,
                              magnifierConfiguration:
                                  widget.magnifierConfiguration ??
                                      TextMagnifierConfiguration.disabled,
                              maxLines: widget.maxLines,
                              minLines: widget.minLines,
                              obscureText: widget.obscureText,
                              obscuringCharacter: widget.obscuringCharacter,
                              onAppPrivateCommand: widget.onAppPrivateCommand,
                              onChanged: widget.onChanged ??
                                  (p0) {
                                    setState(() {});
                                  },
                              onEditingComplete: widget.onEditingComplete,
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
                              spellCheckConfiguration:
                                  widget.spellCheckConfiguration,
                              strutStyle: widget.strutStyle,
                              style: widget.style?.textStyle ??
                                  TextStyle(
                                      color: styler.textStyle?.color,
                                      fontSize: styler.textStyle?.fontSize),
                              textAlign: widget.textAlign,
                              textCapitalization: widget.textCapitalization,
                              textDirection: widget.textDirection,
                              textInputAction: widget.textInputAction,
                              undoController: widget.undoController,
                              backgroundCursorColor: const Color(0xFF808080),
                            ),
                          ),
                        ),
                        _buildSuffixIcon()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildPrefixText() {
    if (widget.prefixText != null && widget.prefixText!.isNotEmpty) {
      return Row(
        children: [
          Text(
            widget.prefixText!,
            style: widget.prefixStyle,
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildPrefixIcon() {
    if (widget.prefixIcon != null) {
      return Row(
        children: [
          widget.prefixIcon!,
          const SizedBox(
            width: 10,
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildSuffixIcon() {
    if (widget.suffixIcon != null) {
      return Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          widget.suffixIcon!,
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
