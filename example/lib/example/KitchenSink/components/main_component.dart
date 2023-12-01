import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/components/list_your_place_modal/modal.dart';
import 'package:gluestack_ui_example/example/KitchenSink/components/stacked_card.dart';
import 'package:gluestack_ui_example/example/KitchenSink/models/stacked_card.dart';

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
    return VStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //r1
        HStack(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Heading(size: GSSizes.$xl, text: 'New this week'),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: Button(
                variant: GSVariants.outline,
                action: GSActions.secondary,
                child: HStack(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GSButtonIcon(
                        icon: Icons.list,
                        iconSize: GSSizes.$xl,
                        style: GSStyle(
                            color: $GSColors.textLight800,
                            dark: GSStyle(color: $GSColors.textDark300)),
                      ),
                      ButtonText(
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
                        return const ListYourPlaceModal();
                      });
                },
              ),
            ),
          ],
        ),
        //r2
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: HStack(
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
          child: ButtonGroup(
              // isAttached: true,
              buttons: [
                for (String title in titles) ...[
                  Button(
                      action: GSActions.secondary,
                      variant: GSVariants
                          .link, //Error: link variant should show underline in text
                      //Error: Should throw assertion for wrong vals like accent n stuff

                      onPressed: () {
                        print("$title pressed!");
                      },
                      child: ButtonText(
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

        HStack(
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
