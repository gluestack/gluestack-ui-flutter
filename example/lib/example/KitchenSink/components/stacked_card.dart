import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/models/stacked_card.dart';

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
                    child: GSImage(
                        borderRadius: GSBorderRadius.$md,
                        fit: BoxFit.cover,
                        style: GSStyle(
                            height: $GSSpace.$72, width: double.infinity),
                        path: stackedCardModel.imageUrl,
                        imageType: GSImageType.asset),
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
