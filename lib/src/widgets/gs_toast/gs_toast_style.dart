import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsToastConfig = GSStyleConfig(
  componentName: 'Toast',
  descendantStyle: ['_icon', '_title', '_description'],
);
GSStyle toastStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().toast,
    descendantStyle: gsToastConfig.descendantStyle);

// GSStyle compoundVariants = GSStyle(
//   variants: Variants(
//     action: GSAction(
//       error: GSStyle(
//         variants: Variants(
//           variant: GSVariant(
//               solid: toastStyle
//                   .merge(toastStyle.variants?.action?.error)
//                   .merge(toastStyle.variants?.variant?.solid),
//               outline: toastStyle
//                   .merge(toastStyle.variants?.action?.error)
//                   .merge(toastStyle.variants?.variant?.outline),
//               accent: toastStyle
//                   .merge(toastStyle.variants?.action?.error)
//                   .merge(toastStyle.variants?.variant?.accent)),
//         ),
//       ),
//       warning: GSStyle(
//         variants: Variants(
//           variant: GSVariant(
//               solid: toastStyle
//                   .merge(toastStyle.variants?.action?.warning)
//                   .merge(toastStyle.variants?.variant?.solid),
//               outline: toastStyle
//                   .merge(toastStyle.variants?.action?.warning)
//                   .merge(toastStyle.variants?.variant?.outline),
//               accent: toastStyle
//                   .merge(toastStyle.variants?.action?.warning)
//                   .merge(toastStyle.variants?.variant?.accent)),
//         ),
//       ),
//       success: GSStyle(
//         variants: Variants(
//           variant: GSVariant(
//               solid: toastStyle
//                   .merge(toastStyle.variants?.action?.success)
//                   .merge(toastStyle.variants?.variant?.solid),
//               outline: toastStyle
//                   .merge(toastStyle.variants?.action?.success)
//                   .merge(toastStyle.variants?.variant?.outline),
//               accent: toastStyle
//                   .merge(toastStyle.variants?.action?.success)
//                   .merge(toastStyle.variants?.variant?.accent)),
//         ),
//       ),
//       info: GSStyle(
//         variants: Variants(
//           variant: GSVariant(
//               solid: toastStyle
//                   .merge(toastStyle.variants?.action?.info)
//                   .merge(toastStyle.variants?.variant?.solid),
//               outline: toastStyle
//                   .merge(toastStyle.variants?.action?.info)
//                   .merge(toastStyle.variants?.variant?.outline),
//               accent: toastStyle
//                   .merge(toastStyle.variants?.action?.info)
//                   .merge(toastStyle.variants?.variant?.accent)),
//         ),
//       ),
//       attention: GSStyle(
//         variants: Variants(
//           variant: GSVariant(
//               solid: toastStyle
//                   .merge(toastStyle.variants?.action?.attention)
//                   .merge(toastStyle.variants?.variant?.solid),
//               outline: toastStyle
//                   .merge(toastStyle.variants?.action?.attention)
//                   .merge(toastStyle.variants?.variant?.outline),
//               accent: toastStyle
//                   .merge(toastStyle.variants?.action?.attention)
//                   .merge(toastStyle.variants?.variant?.accent)),
//         ),
//       ),
//     ),
//   ),
// );

// class GSToastStyle {
//   static Map<GSActions, Map<GSVariants, GSStyle>> gsToastCombination = {
//     GSActions.error: {
//       GSVariants.solid:
//           compoundVariants.variants!.action!.error!.variants!.variant!.solid!,
//       GSVariants.outline:
//           compoundVariants.variants!.action!.error!.variants!.variant!.outline!,
//       GSVariants.accent:
//           compoundVariants.variants!.action!.error!.variants!.variant!.accent!
//     },
//     GSActions.warning: {
//       GSVariants.solid:
//           compoundVariants.variants!.action!.warning!.variants!.variant!.solid!,
//       GSVariants.outline: compoundVariants
//           .variants!.action!.warning!.variants!.variant!.outline!,
//       GSVariants.accent:
//           compoundVariants.variants!.action!.warning!.variants!.variant!.accent!
//     },
//     GSActions.success: {
//       GSVariants.solid:
//           compoundVariants.variants!.action!.success!.variants!.variant!.solid!,
//       GSVariants.outline: compoundVariants
//           .variants!.action!.success!.variants!.variant!.outline!,
//       GSVariants.accent:
//           compoundVariants.variants!.action!.success!.variants!.variant!.accent!
//     },
//     GSActions.info: {
//       GSVariants.solid:
//           compoundVariants.variants!.action!.info!.variants!.variant!.solid!,
//       GSVariants.outline:
//           compoundVariants.variants!.action!.info!.variants!.variant!.outline!,
//       GSVariants.accent:
//           compoundVariants.variants!.action!.info!.variants!.variant!.accent!
//     },
//     GSActions.attention: {
//       GSVariants.solid: compoundVariants
//           .variants!.action!.attention!.variants!.variant!.solid!,
//       GSVariants.outline: compoundVariants
//           .variants!.action!.attention!.variants!.variant!.outline!,
//       GSVariants.accent: compoundVariants
//           .variants!.action!.attention!.variants!.variant!.accent!
//     },
//   };
// }
