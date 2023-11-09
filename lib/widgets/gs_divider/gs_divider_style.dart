import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/divider/divider.dart';

final GSStyle dividerStyle = GSStyle.fromMap(data: dividerData);

GSStyle baseStyle = GSStyle(
  bg: dividerStyle.bg,
  dark: GSStyle(bg: dividerStyle.bg),
);

GSStyle compoundVariants = GSStyle(
  variants: Variants(
    orientation: GSOrientation(
      horizontal:
          baseStyle.merge(dividerStyle.variants?.orientation?.horizontal),
      vertical: baseStyle.merge(dividerStyle.variants?.orientation?.vertical),
    ),
  ),
);

class GSDividerStyle {
  static Map<GSOrientations, GSStyle> gsDividerCombination = {
    GSOrientations.vertical: compoundVariants.variants!.orientation!.vertical!,
    GSOrientations.horizontal:
        compoundVariants.variants!.orientation!.horizontal!,
  };
}
