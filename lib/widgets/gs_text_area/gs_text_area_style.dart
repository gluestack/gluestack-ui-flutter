import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/text_area/text_area.dart';

GSStyle textAreaStyle = GSStyle.fromMap(data: textAreaData);
// GSStyle baseStyle = GSStyle(
//   borderWidth: textAreaStyle.borderWidth,
//   borderColor: textAreaStyle.borderColor,
//   borderRadius: textAreaStyle.borderRadius,
//   opacity: textAreaStyle.onDisabled?.opacity,
//   onHover: textAreaStyle.onHover,
//   onFocus: textAreaStyle.onFocus,
// );

// GSStyle compoundVariants = GSStyle(
//   variants: Variants(
//     variant: GSVariant(
//       underlined: baseStyle.merge(inputStyle.variants?.variant?.underlined),
//       outline: baseStyle.merge(inputStyle.variants?.variant?.outline),
//       rounded: baseStyle.merge(inputStyle.variants?.variant?.rounded),
//     ),
//     size: inputStyle.variants?.size,
//   ),
// );

class GSTextAreaStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$sm: textAreaStyle.variants!.size!.$sm!,
    GSSizes.$md: textAreaStyle.variants!.size!.$md!,
    GSSizes.$lg: textAreaStyle.variants!.size!.$lg!,
    GSSizes.$xl: textAreaStyle.variants!.size!.$xl!,
  };
}
