import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/models/type_of_places.dart';

class KSTypesOfPlaces extends StatelessWidget {
  KSTypesOfPlaces({super.key});
  final List<TypeOfPlacesModel> _typeOfPlacesData = [
    TypeOfPlacesModel(label: 'Entire place', value: 'entirePlace'),
    TypeOfPlacesModel(label: 'Private room', value: 'privateRoom'),
    TypeOfPlacesModel(label: 'Shared room', value: 'sharedRoom'),
  ];
  @override
  Widget build(BuildContext context) {
    return VStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(
          text: "Type of place",
          size: GSSizes.$sm,
        ),
        CheckBoxGroup(
            values: [
              _typeOfPlacesData[0].value,
            ],
            child: VStack(
              space: GSSpaces.$lg,
              children: [
                for (int i = 0; i < _typeOfPlacesData.length; i++)
                  CheckBox(
                    size: GSSizes.$sm,
                    onChanged: (value) {},
                    icon: CheckBoxIndicator(
                        style: GSStyle(
                            margin: const EdgeInsets.only(right: $GSSpace.$3)),
                        child: const CheckBoxIcon()),
                    value: _typeOfPlacesData[i].value,
                    label: GSCheckBoxLabel(text: _typeOfPlacesData[i].label),
                  ),
              ],
            ))
      ],
    );
  }
}
