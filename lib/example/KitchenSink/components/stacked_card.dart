import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/models/stacked_card.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_box/gs_box.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector_proider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSStackedCard extends StatelessWidget {
  final StackedCardModel stackedCardModel;
  const KSStackedCard({super.key, required this.stackedCardModel});

  @override
  Widget build(BuildContext context) {
    return GSFocusableActionDetector(
      child: Builder(builder: (context) {
        final isHovered = GSFocusableActionDetectorProvider.isHovered(context);

        return GSBox(
          style: GSStyle(width: 400),
          child: GSVStack(
            space: GSSpaces.$xs,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: isHovered ? .9 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular($GSRadii.$md),
                      child: GSImage(
                          fit: BoxFit.cover,
                          style: GSStyle(
                              height: $GSSpace.$72, width: double.infinity),
                          path: stackedCardModel.imageUrl,
                          imageType: GSImageType.asset),
                    ),
                  ),
                  if (isHovered)
                    Opacity(
                      opacity: .3,
                      child: GSBox(
                        style: GSStyle(
                            height: $GSSpace.$72,
                            width: double.infinity,
                            color: $GSColors.backgroundDark950),
                      ),
                    ),
                  if (isHovered)
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: GSButton(
                          action: GSActions.secondary,
                          variant: GSVariants.outline,
                          style: GSStyle(
                              descendantStyles: {
                                '_icon': GSStyle(color: $GSColors.white)
                              },
                              bg: Colors.transparent,
                              borderColor: $GSColors.white,
                              onHover: GSStyle(
                                bg: Colors.transparent,
                                borderColor: $GSColors.white,
                              )),
                          child: Row(
                            children: [
                              GSText(text: stackedCardModel.buttonText),
                              const GSButtonIcon(icon: Icons.arrow_forward_ios)
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  Positioned(
                      right: $GSSpace.$4,
                      top: $GSSpace.$4,
                      child: GSPressable(
                          onPress: () {},
                          child: GSIcon(
                              style: GSStyle(
                                height: $GSSpace.$6,
                                width: $GSSpace.$6,
                              ),
                              icon: Icons.favorite_border)))
                ],
              ),
              GSHStack(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GSText(
                      style: GSStyle(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: $GSColors.textLight900,
                          ),
                          dark: GSStyle(
                              textStyle: const TextStyle(
                            color: $GSColors.textDark200,
                          ))),
                      text: stackedCardModel.title),
                  GSHStack(
                    children: [
                      const GSIcon(icon: Icons.star),
                      GSText(
                          style: GSStyle(
                              textStyle: const TextStyle(
                                color: $GSColors.textLight900,
                              ),
                              dark: GSStyle(
                                  textStyle: const TextStyle(
                                color: $GSColors.textDark200,
                              ))),
                          text: stackedCardModel.rating.toString())
                    ],
                  )
                ],
              ),
              GSText(
                  size: GSSizes.$sm,
                  style: GSStyle(
                      textStyle: const TextStyle(
                        color: $GSColors.textLight500,
                      ),
                      dark: GSStyle(
                          textStyle: const TextStyle(
                        color: $GSColors.textDark500,
                      ))),
                  text: stackedCardModel.location),
              GSHStack(
                children: [
                  GSText(
                    size: GSSizes.$sm,
                    text: stackedCardModel.price,
                    style: GSStyle(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: $GSColors.textLight900,
                        ),
                        dark: GSStyle(
                            textStyle: const TextStyle(
                          color: $GSColors.textDark200,
                        ))),
                  ),
                  GSText(
                      size: GSSizes.$sm,
                      style: GSStyle(
                          textStyle: const TextStyle(
                            color: $GSColors.textLight900,
                          ),
                          dark: GSStyle(
                              textStyle: const TextStyle(
                            color: $GSColors.textDark200,
                          ))),
                      text: 'night')
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
