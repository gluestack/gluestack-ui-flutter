// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

// class GSFormTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? initialValue;
//   final FocusNode? focusNode;
//   final InputDecoration decoration;
//   final TextInputType? keyboardType;
//   final TextCapitalization textCapitalization;
//   final TextInputAction? textInputAction;
//   final TextStyle? style;
//   final StrutStyle? strutStyle;
//   final TextDirection? textDirection;
//   final TextAlign textAlign;
//   final TextAlignVertical? textAlignVertical;
//   final bool autofocus;
//   final bool readOnly;
//   final ToolbarOptions? toolbarOptions;
//   final bool? showCursor;
//   final String obscuringCharacter;
//   final bool obscureText;
//   final bool autocorrect;
//   final SmartDashesType? smartDashesType;
//   final SmartQuotesType? smartQuotesType;
//   final bool enableSuggestions;
//   final MaxLengthEnforcement? maxLengthEnforcement;
//   final int? maxLines;
//   final int? minLines;
//   final bool expands;
//   final int? maxLength;
//   final ValueChanged<String>? onChanged;
//   final GestureTapCallback? onTap;
//   final TapRegionCallback? onTapOutside;
//   final VoidCallback? onEditingComplete;
//   final ValueChanged<String>? onFieldSubmitted;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool? enabled;
//   final double cursorWidth;
//   final double? cursorHeight;
//   final Radius? cursorRadius;
//   final Color? cursorColor;
//   final Brightness? keyboardAppearance;
//   final EdgeInsets scrollPadding;
//   final bool? enableInteractiveSelection;
//   final TextSelectionControls? selectionControls;
//   final InputCounterWidgetBuilder? buildCounter;
//   final ScrollPhysics? scrollPhysics;
//   final Iterable<String>? autofillHints;
//   final AutovalidateMode? autovalidateMode;
//   final ScrollController? scrollController;
//   final bool enableIMEPersonalizedLearning;
//   final MouseCursor? mouseCursor;
//   final EditableTextContextMenuBuilder? contextMenuBuilder;
//   final SpellCheckConfiguration? spellCheckConfiguration;
//   final TextMagnifierConfiguration? magnifierConfiguration;
//   final UndoHistoryController? undoController;
//   final AppPrivateCommandCallback? onAppPrivateCommand;
//   final bool? cursorOpacityAnimates;
//   final ui.BoxHeightStyle selectionHeightStyle;
//   final ui.BoxWidthStyle selectionWidthStyle;
//   final DragStartBehavior dragStartBehavior;
//   final ContentInsertionConfiguration? contentInsertionConfiguration;
//   final Clip clipBehavior;
//   final bool scribbleEnabled;
//   final bool canRequestFocus;
//   final FormFieldValidator? validator;
//   final String? restorationId;
//   final FormFieldSetter? onSaved;
  
//   const GSFormTextField({
//     super.key,
//     this.controller,
//     this.initialValue,
//     this.focusNode,
//     this.decoration = const InputDecoration(),
//     this.keyboardType,
//     this.textCapitalization = TextCapitalization.none,
//     this.textInputAction,
//     this.style,
//     this.strutStyle,
//     this.textDirection,
//     this.textAlign = TextAlign.start,
//     this.textAlignVertical,
//     this.autofocus = false,
//     this.readOnly = false,
//     this.toolbarOptions,
//     this.showCursor,
//     this.obscuringCharacter = '•',
//     this.obscureText = false,
//     this.autocorrect = true,
//     this.smartDashesType,
//     this.smartQuotesType,
//     this.enableSuggestions = true,
//     this.maxLengthEnforcement,
//     this.maxLines = 1,
//     this.minLines,
//     this.expands = false,
//     this.maxLength,
//     this.onChanged,
//     this.onTap,
//     this.onTapOutside,
//     this.onEditingComplete,
//     this.onFieldSubmitted,
//     this.inputFormatters,
//     this.enabled,
//     this.cursorWidth = 2.0,
//     this.cursorHeight,
//     this.cursorRadius,
//     this.cursorColor,
//     this.keyboardAppearance,
//     this.scrollPadding = const EdgeInsets.all(20.0),
//     this.enableInteractiveSelection,
//     this.selectionControls,
//     this.buildCounter,
//     this.scrollPhysics,
//     this.autofillHints,
//     this.autovalidateMode,
//     this.scrollController,
//     this.enableIMEPersonalizedLearning = true,
//     this.mouseCursor,
//     this.contextMenuBuilder,
//     this.spellCheckConfiguration,
//     this.magnifierConfiguration,
//     this.undoController,
//     this.onAppPrivateCommand,
//     this.cursorOpacityAnimates,
//     this.selectionHeightStyle = ui.BoxHeightStyle.tight,
//     this.selectionWidthStyle = ui.BoxWidthStyle.tight,
//     this.dragStartBehavior = DragStartBehavior.start,
//     this.contentInsertionConfiguration,
//     this.clipBehavior = Clip.hardEdge,
//     this.scribbleEnabled = true,
//     this.canRequestFocus = true,
//     this.validator,
//     this.restorationId,
//     this.onSaved,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       key: key,
//       onSaved: onSaved,
//       restorationId: restorationId,
//       validator: validator,
//       controller: controller,
//       initialValue: initialValue,
//       focusNode: focusNode,
//       decoration: decoration,
//       keyboardType: keyboardType,
//       textCapitalization: textCapitalization,
//       textInputAction: textInputAction,
//       style: style,
//       strutStyle: strutStyle,
//       textDirection: textDirection,
//       textAlign: textAlign,
//       textAlignVertical: textAlignVertical,
//       autofocus: autofocus,
//       readOnly: readOnly,
//       toolbarOptions: toolbarOptions,
//       showCursor: showCursor,
//       obscuringCharacter: obscuringCharacter,
//       obscureText: obscureText,
//       autocorrect: autocorrect,
//       smartDashesType: smartDashesType,
//       smartQuotesType: smartQuotesType,
//       enableSuggestions: enableSuggestions,
//       maxLengthEnforcement: maxLengthEnforcement,
//       maxLines: maxLines,
//       minLines: minLines,
//       expands: expands,
//       maxLength: maxLength,
//       onChanged: onChanged,
//       onTap: onTap,
//       onTapOutside: onTapOutside,
//       onEditingComplete: onEditingComplete,
//       onFieldSubmitted: onFieldSubmitted,
//       inputFormatters: inputFormatters,
//       enabled: enabled,
//       cursorWidth: cursorWidth,
//       cursorHeight: cursorHeight,
//       cursorRadius: cursorRadius,
//       cursorColor: cursorColor,
//       keyboardAppearance: keyboardAppearance,
//       scrollPadding: scrollPadding,
//       enableInteractiveSelection: enableInteractiveSelection,
//       selectionControls: selectionControls,
//       buildCounter: buildCounter,
//       scrollPhysics: scrollPhysics,
//       autofillHints: autofillHints,
//       autovalidateMode: autovalidateMode,
//       scrollController: scrollController,
//       enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
//       mouseCursor: mouseCursor,
//       contextMenuBuilder: contextMenuBuilder,
//       spellCheckConfiguration: spellCheckConfiguration,
//       magnifierConfiguration: magnifierConfiguration,
//       undoController: undoController,
//       onAppPrivateCommand: onAppPrivateCommand,
//       cursorOpacityAnimates: cursorOpacityAnimates,
//       selectionHeightStyle: selectionHeightStyle,
//       selectionWidthStyle: selectionWidthStyle,
//       dragStartBehavior: dragStartBehavior,
//       contentInsertionConfiguration: contentInsertionConfiguration,
//       clipBehavior: clipBehavior,
//       scribbleEnabled: scribbleEnabled,
//       canRequestFocus: canRequestFocus,
//     );
//   }
// }
