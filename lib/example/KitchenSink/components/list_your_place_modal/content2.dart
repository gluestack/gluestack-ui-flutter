import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/models/ammenities.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/radii_token.dart';
import 'package:gluestack_flutter_pro/token/space_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_indicator.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_label.dart';

import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';

import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class ListYourPlaceModalContent2 extends StatelessWidget {
  final Function nextFunction;
  final Function backFunction;
  ListYourPlaceModalContent2(
      {super.key, required this.nextFunction, required this.backFunction});
  final List<AmmenitiesModel> _ammenitiesData = [
    AmmenitiesModel(label: 'Wifi', value: 'wifi'),
    AmmenitiesModel(label: 'Washing machine', value: 'washing-machine'),
    AmmenitiesModel(label: 'Air conditioning', value: 'air-conditioning'),
    AmmenitiesModel(label: 'Kitchen', value: 'kitchen'),
    AmmenitiesModel(label: 'Dryer', value: 'dryer'),
    AmmenitiesModel(label: 'Iron', value: 'Iron'),
    AmmenitiesModel(label: 'Hair Dryer', value: 'hair-dryer'),
  ];
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      mainAxisSize: MainAxisSize.min,
      space: GSSpaces.$md,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSText(text: "Ammenities", bold: true, size: GSSizes.$sm),
        GSCheckBoxGroup(
            values: [
              _ammenitiesData[0].value,
              _ammenitiesData[2].value,
            ],
            child: GSVStack(
              space: GSSpaces.$md,
              children: [
                for (int i = 0; i < (_ammenitiesData.length); i++)
                  GSCheckBox(
                    size: GSSizes.$sm,
                    onChanged: (value) {},
                    icon: GSCheckBoxIndicator(
                        style: GSStyle(
                            margin: const EdgeInsets.only(right: $GSSpace.$3)),
                        child: const GSCheckBoxIcon()),
                    value: _ammenitiesData[i].value,
                    label: GSCheckBoxLabel(text: _ammenitiesData[i].label),
                  ),
              ],
            )),
        SizedBox(
          width: double.infinity,
          child: GSButton(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.negative,
            child: const GSButtonText(text: 'Next'),
            onPressed: () {
              nextFunction.call();
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: GSButton(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.secondary,
            variant: GSVariants.outline,
            child: const GSButtonText(text: 'Back'),
            onPressed: () {
              backFunction.call();
            },
          ),
        )
      ],
    );
  }
}
