import 'package:flutter/material.dart';
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
  const KSStackedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GSFocusableActionDetector(
      child: Builder(builder: (context) {
        final isHovered = GSFocusableActionDetectorProvider.isHovered(context);

        return GSBox(
          style: GSStyle(width: 400),
          child: GSVStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: isHovered ? .8 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular($GSRadii.$md),
                      child: GSImage(
                          fit: BoxFit.cover,
                          style: GSStyle(height: 200, width: double.infinity),
                          path: "assets/images/image16.png",
                          imageType: GSImageType.asset),
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
                            onHover: GSStyle(bg: Colors.transparent),
                          ),
                          child: const Row(
                            children: [
                              GSText(text: 'Explore'),
                              GSButtonIcon(icon: Icons.arrow_forward_ios)
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
                          child: GSIcon(icon: Icons.favorite_border)))
                ],
              ),
              const GSHStack(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GSHeading(text: 'ImageView Inn'),
                  GSHStack(
                    children: [GSIcon(icon: Icons.star), GSText(text: '4.9')],
                  )
                ],
              ),
              const GSText(
                  text: '401 Platte River Rd, Gothenburg, United States'),
              const GSText(text: '\$1,481night')
            ],
          ),
        );
      }),
    );
  }
}
