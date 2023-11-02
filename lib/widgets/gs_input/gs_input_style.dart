import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/input/input.dart';

GSStyle inputStyle = GSStyle.fromMap(data: inputData);
GSStyle baseStyle = GSStyle(
  borderWidth: inputStyle.borderWidth,
  borderColor: inputStyle.borderColor,
  borderRadius: inputStyle.borderRadius,
  opacity: inputStyle.onDisabled?.opacity,
  onHover: inputStyle.onHover,
  onFocus: inputStyle.onFocus,
);

GSStyle compoundVariants = GSStyle(
  variants: Variants(
    variant: GSVariant(
      underlined: baseStyle.merge(inputStyle.variants?.variant?.underlined),
      outline: baseStyle.merge(inputStyle.variants?.variant?.outline),
      rounded: baseStyle.merge(inputStyle.variants?.variant?.rounded),
    ),
    size: inputStyle.variants?.size,
  ),
);

class GSInputStyle {
  static Map<GSVariants, GSStyle> gsInputCombination = {
    GSVariants.underlined: compoundVariants.variants!.variant!.underlined!,
    GSVariants.outline: compoundVariants.variants!.variant!.outline!,
    GSVariants.rounded: compoundVariants.variants!.variant!.rounded!,
  };

  static Map<GSSizes, GSStyle> size = {
    GSSizes.sm: compoundVariants.variants!.size!.sm!,
    GSSizes.md: compoundVariants.variants!.size!.md!,
    GSSizes.lg: compoundVariants.variants!.size!.lg!,
    GSSizes.xl: compoundVariants.variants!.size!.xl!,
  };
}
