import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_attributes.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';
import 'package:provider/provider.dart';

/*
add focus color in parameters;



*/

class GSInput extends StatelessWidget {
  final GSInputVariant variant;
  final GSInputSize size;
  final StyleData? style;
  final bool readOnly;
  final bool enabled;
  final bool vaild;
  const GSInput(
      {super.key,
      this.variant = GSInputVariant.outline,
      this.size = GSInputSize.md,
      this.readOnly = false,
      this.enabled = true,
      this.vaild = true,
      this.style});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    final gsInputStyle = GsInputAttributes.gsInputCombination[variant]![theme];
    final borderWidth = style?.borderWidth ?? 1.0;
    final borderColor = !vaild
        ? $GSColors.error700
        : style?.borderColor ?? gsInputStyle?.borderColor!;
    final borderStyle = gsInputStyle?.border != null
        ? gsInputStyle?.border?.copyWith(
            borderRadius: style?.borderRadius != null
                ? BorderRadius.circular(style!.borderRadius!)
                : variant != GSInputVariant.outline
                    ? GsInputAttributes.inputBorderRadius[size]
                    : null,
            borderSide: BorderSide(color: borderColor!, width: borderWidth))
        : UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor!, width: borderWidth));

    return SizedBox(
        width: style?.width,
        height: style?.height ?? GsInputAttributes.inputSize[size],
        child: TextField(
          enabled: enabled,
          readOnly: readOnly,
          decoration: InputDecoration(
              enabledBorder: borderStyle,
              contentPadding: style?.padding ?? gsInputStyle?.px,
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



// class GsInput extends StatelessWidget {
//   final GSInputVariant variant;
//   final GSInputSize size;
//   final StyleData? style;
//   final bool isDisabled;
//   final bool isReadOnly;
//   final bool isInvaild;
//   const GsInput(
//       {super.key,
//       this.variant = GSInputVariant.outline,
//       this.size = GSInputSize.sm,
//       this.isReadOnly = false,
//       this.isDisabled = false,
//       this.isInvaild = false,
//       this.style});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Provider.of<ThemeProvider>(context).currentTheme;
//     final gsInputStyle = GsInputAttributes.gsInputCombination[variant]![theme];

//     return SizedBox(
//         height: GsInputAttributes.inputSize[size]!,
//         child: TextField(
//           readOnly: isReadOnly,
//           enabled: !isDisabled,
//           decoration: InputDecoration(
//               contentPadding: style != null
//                   ? style!.padding ?? gsInputStyle?.px
//                   : gsInputStyle?.px,
//               hintText: "Enter Text Here",
//               enabledBorder: isInvaild
//                   ? gsInputStyle != null && gsInputStyle.border != null
//                       ? gsInputStyle.border!.copyWith(
//                           borderRadius: style?.borderRadius != null
//                               ? BorderRadius.circular(style!.borderRadius!)
//                               : variant == GSInputVariant.rounded
//                                   ? GsInputAttributes.inputBorderRadius[size]
//                                   : null,
//                           borderSide: BorderSide(
//                             color: $GSColors.error700,
//                             width:
//                                 style != null ? style!.borderWidth ?? 1.0 : 1.0,
//                           ),
//                         )
//                       : UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: $GSColors.error700,
//                             width:
//                                 style != null ? style!.borderWidth ?? 1.0 : 1.0,
//                           ),
//                         )
//                   : null,
//               border: gsInputStyle?.border?.copyWith(
//                   borderRadius: style?.borderRadius != null
//                       ? BorderRadius.circular(style!.borderRadius!)
//                       : variant == GSInputVariant.rounded
//                           ? GsInputAttributes.inputBorderRadius[size]
//                           : null,
//                   borderSide: BorderSide(
//                     color: style != null
//                         ? style!.borderColor ?? gsInputStyle.borderColor!
//                         : gsInputStyle.borderColor!,
//                     width: style != null ? style!.borderWidth ?? 1.0 : 1.0,
//                   ))),
//         ));
//   }
// }
