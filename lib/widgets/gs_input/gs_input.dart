import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_attributes.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';
import 'package:provider/provider.dart';

class GsInput extends StatelessWidget {
  final GSInputVariant variant;
  final GSInputSize size;
  final StyleData? style;
  final bool isDisabled;
  final bool isReadOnly;
  final bool isInvaild;
  const GsInput(
      {super.key,
      this.variant = GSInputVariant.underlined,
      this.size = GSInputSize.sm,
      this.isReadOnly = false,
      this.isDisabled = false,
      this.isInvaild = false,
      this.style});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    final gsInputStyle = GsInputAttributes.gsInputCombination[variant]![theme];

    return SizedBox(
        height: GsInputAttributes.inputSize[size]!,
        child: TextField(
          readOnly: isReadOnly,
          enabled: !isDisabled,
          decoration: InputDecoration(
              hintText: "Enter Text Here",
              enabledBorder: isInvaild
                  ? gsInputStyle != null && gsInputStyle.border != null
                      ? gsInputStyle.border!.copyWith(
                          borderRadius: style != null
                              ? style!.borderRadius != null
                                  ? BorderRadius.circular(style!.borderRadius!)
                                  : GsInputAttributes.inputBorderRadius[size]!
                              : GsInputAttributes.inputBorderRadius[size]!,
                          borderSide: BorderSide(
                            color: Colors.red,
                            width:
                                style != null ? style!.borderWidth ?? 1.0 : 1.0,
                          ),
                        )
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width:
                                style != null ? style!.borderWidth ?? 1.0 : 1.0,
                          ),
                        )
                  : null,
              border: gsInputStyle?.border?.copyWith(
                  borderRadius: style?.borderRadius != null
                      ? BorderRadius.circular(style!.borderRadius!)
                      : null,
                  borderSide: BorderSide(
                    color: style != null
                        ? style!.borderColor ?? gsInputStyle.borderColor!
                        : gsInputStyle.borderColor!,
                    width: style != null ? style!.borderWidth ?? 1.0 : 1.0,
                  ))),
        ));
  }
}
