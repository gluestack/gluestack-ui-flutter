import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/list_your_place_modal/modal1.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/stacked_card.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/models/stacked_card.dart';

import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';

import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_content.dart';
import 'package:gluestack_flutter_pro/widgets/gs_box/gs_box.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';

import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';
import 'package:provider/provider.dart';

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

List<StackedCardModel> stackedCardData = [
  StackedCardModel(
      imageUrl: 'assets/images/image16.png',
      price: '\$1,481',
      rating: 4.9,
      location: "401 Platte River Rd, Gothenburg, United States",
      buttonText: 'Explore',
      title: 'ImageView Inn'),
  StackedCardModel(
      imageUrl: 'assets/images/image17.png',
      price: '\$1,381',
      rating: 4.89,
      location: "1502 Silica Ave, Sacramento California",
      buttonText: 'Explore',
      title: 'Spinner Resort'),
  StackedCardModel(
      imageUrl: 'assets/images/image18.png',
      price: '\$2,481',
      rating: 4.6,
      location: "2945 Entry Point Blvd, Kissimmee, Florida",
      buttonText: 'Explore',
      title: 'DropDown Den'),
];

class KSMainComponent extends StatelessWidget {
  const KSMainComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
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
                            dark: GSStyle(color: $GSColors.textDark300)),
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
                              color: $GSColors.textDark300,
                            ),
                          ),
                        ),
                      ),
                    ]),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return ListYourPlaceModal1();
                      });
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
                              color:
                                  $GSColors.textDark50, //Error: Does not work
                            ),
                          ),
                        ),
                      ))
                ]
              ]),
        ),

        GSHStack(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          space: GSSpaces.$md,
          children: [
            for (int i = 0; i < stackedCardData.length; i++)
              Expanded(
                  child: KSStackedCard(
                stackedCardModel: stackedCardData[i],
              )),
          ],
        )
      ],
    );
  }
}
