import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:kitchensink_gluestack/models/ammenities.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              space: GSSpaces.$md,
              children: [
                for (int i = 0; i < (_ammenitiesData.length); i++)
                  GSCheckBox(
                    size: GSSizes.$sm,
                    onChanged: (value) {},
                    icon: GSCheckBoxIndicator(
                        style: GSStyle(
                            margin: EdgeInsets.only(right: $GSSpace.$2)),
                        child: const GSCheckBoxIcon()),
                    value: _ammenitiesData[i].value,
                    label: GSCheckBoxLabel(text: _ammenitiesData[i].label),
                  ),
              ],
            )),
        GSBox(
          style: GSStyle(width: double.infinity),
          child: GSButton(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.negative,
            child: const GSButtonText(text: 'Next'),
            onPressed: () {
              nextFunction.call();
            },
          ),
        ),
        GSBox(
          style: GSStyle(width: double.infinity),
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
