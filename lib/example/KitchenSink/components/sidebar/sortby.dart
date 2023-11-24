import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

enum KSSortOptions {
  topRating,
  bestPrice,
  discount,
  whatsNew,
}

class KSSortBy extends StatefulWidget {
  const KSSortBy({super.key});

  @override
  State<KSSortBy> createState() => _KSSortByState();
}

class _KSSortByState extends State<KSSortBy> {
  KSSortOptions currentSelectedOption = KSSortOptions.topRating;
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          size: GSSizes.$md,
          text: 'Sort by',
        ),
        GSRadio<KSSortOptions>(
          style: GSStyle(margin: const EdgeInsets.only(right: $GSSpace.$3)),
          icon: const GSRadioIcon<KSSortOptions>(),
          groupValue: currentSelectedOption,
          value: KSSortOptions.topRating,
          label: const GSRadioText<KSSortOptions>(text: "Top Ratings"),
          onChanged: (value) {
            setState(() {
              currentSelectedOption = value!;
            });
          },
        ),
        GSRadio<KSSortOptions>(
          style: GSStyle(margin: const EdgeInsets.only(right: $GSSpace.$3)),
          icon: const GSRadioIcon<KSSortOptions>(),
          groupValue: currentSelectedOption,
          value: KSSortOptions.bestPrice,
          label: const GSRadioText<KSSortOptions>(text: "Best Price"),
          onChanged: (value) {
            setState(() {
              currentSelectedOption = value!;
            });
          },
        ),
        GSRadio<KSSortOptions>(
          style: GSStyle(margin: const EdgeInsets.only(right: $GSSpace.$3)),
          icon: const GSRadioIcon<KSSortOptions>(),
          groupValue: currentSelectedOption,
          value: KSSortOptions.discount,
          label: const GSRadioText<KSSortOptions>(text: "Discount"),
          onChanged: (value) {
            setState(() {
              currentSelectedOption = value!;
            });
          },
        ),
        GSRadio<KSSortOptions>(
          style: GSStyle(margin: const EdgeInsets.only(right: $GSSpace.$3)),
          icon: const GSRadioIcon<KSSortOptions>(),
          groupValue: currentSelectedOption,
          value: KSSortOptions.whatsNew,
          label: const GSRadioText<KSSortOptions>(text: "Whats's new"),
          onChanged: (value) {
            setState(() {
              currentSelectedOption = value!;
            });
          },
        )
      ],
    );
  }
}
