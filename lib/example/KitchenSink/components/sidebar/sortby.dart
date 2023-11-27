import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/models/ks_sort_by.dart';
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
  final List<KSSortByModel> _sortByData = [
    KSSortByModel(
      ksSortOptions: KSSortOptions.topRating,
      label: 'Top ratings',
    ),
    KSSortByModel(
      ksSortOptions: KSSortOptions.bestPrice,
      label: 'Best price',
    ),
    KSSortByModel(
      ksSortOptions: KSSortOptions.discount,
      label: 'Discount',
    ),
    KSSortByModel(
      ksSortOptions: KSSortOptions.whatsNew,
      label: 'What’s new',
    ),
  ];

  KSSortOptions currentSelectedOption = KSSortOptions.topRating;
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          size: GSSizes.$sm,
          text: 'Sort by',
        ),
        for (int i = 0; i < _sortByData.length; i++)
          GSRadio<KSSortOptions>(
            style: GSStyle(
                margin: const EdgeInsets.only(
                    right: $GSSpace.$3, left: $GSSpace.$1)),
            icon: const GSRadioIcon<KSSortOptions>(
              size: GSSizes.$sm,
            ),
            groupValue: currentSelectedOption,
            value: _sortByData[i].ksSortOptions,
            label: GSRadioText<KSSortOptions>(text: _sortByData[i].label),
            onChanged: (value) {
              setState(() {
                currentSelectedOption = value!;
              });
            },
          ),
      ],
    );
  }
}
