import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/models/ammenities.dart';

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
        CheckBoxGroup(
            values: [
              _ammenitiesData[0].value,
              _ammenitiesData[2].value,
            ],
            child: GSVStack(
              space: GSSpaces.$md,
              children: [
                for (int i = 0; i < (_ammenitiesData.length); i++)
                  CheckBox(
                    size: GSSizes.$sm,
                    onChanged: (value) {},
                    icon: CheckBoxIndicator(
                        style: GSStyle(
                            margin: const EdgeInsets.only(right: $GSSpace.$3)),
                        child: const CheckBoxIcon()),
                    value: _ammenitiesData[i].value,
                    label: GSCheckBoxLabel(text: _ammenitiesData[i].label),
                  ),
              ],
            )),
        SizedBox(
          width: double.infinity,
          child: Button(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.negative,
            child: const ButtonText(text: 'Next'),
            onPressed: () {
              nextFunction.call();
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Button(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.secondary,
            variant: GSVariants.outline,
            child: const ButtonText(text: 'Back'),
            onPressed: () {
              backFunction.call();
            },
          ),
        )
      ],
    );
  }
}
