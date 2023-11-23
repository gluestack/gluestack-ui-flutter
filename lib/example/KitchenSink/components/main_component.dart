import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/font_size_token.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

List<String> titles = [
  "Tropical",
  "Amazing views",
  "Caves",
  "Mansions",
  "Amazing pools",
  "Cabins",
  "Beachfront",
  "Countryside",
  "Tiny homes",
  "National parks",
];

class KSMainComponent extends StatelessWidget {
  const KSMainComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //r1
        GSHStack(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GSHeading(size: GSSizes.$xl, text: 'New this week'),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: GSButton(
                variant: GSVariants.outline,
                action: GSActions.secondary,
                child: GSHStack(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GSButtonIcon(
                        icon: Icons.list,
                        iconSize: GSSizes.$xl,
                        style: GSStyle(
                          color: $GSColors.textLight800,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GSButtonText(
                        text: 'List your place',
                        style: GSStyle(
                          textStyle: const TextStyle(
                            fontSize: $GSFontSize.$md,
                            color: $GSColors.textLight800,
                          ),
                          dark: GSStyle(
                            textStyle: const TextStyle(
                              fontSize: $GSFontSize.$md,
                              color:
                                  $GSColors.textDark300, //Error: Dpes not work
                            ),
                          ),
                        ),
                      ),
                    ]),
                onPressed: () {
                  //TODO: add pop up
                },
              ),
            ),
          ],
        ),
        //r2
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GSHStack(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 1; i < 10; i++)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GSImage(
                        fit: BoxFit.cover,
                        size: GSSizes.$2xl,
                        path: 'assets/images/image$i.png',
                        imageType: GSImageType.asset),
                  ),
                ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GSButtonGroup(
              // isAttached: true,
              buttons: [
                for (String title in titles) ...[
                  GSButton(
                      action: GSActions.secondary,
                      variant: GSVariants
                          .link, //Error: link variant should show underline in text
                      //Error: Should throw assertion for wrong vals like accent n stuff

                      onPressed: () {
                        print("$title pressed!");
                      },
                      child: GSButtonText(
                        text: title,
                        style: GSStyle(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: $GSColors.textLight900),
                          dark: GSStyle(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: $GSColors.textDark50, //Error: Does not work
                            ),
                          ),
                        ),
                      ))
                ]
              ]),
        )
      ],
    );
  }
}
