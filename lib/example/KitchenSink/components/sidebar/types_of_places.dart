import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/models/type_of_places.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/space_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_indicator.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_label.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSTypesOfPlaces extends StatelessWidget {
  KSTypesOfPlaces({super.key});
  final List<TypeOfPlacesModel> _typeOfPlacesData = [
    TypeOfPlacesModel(label: 'Entire place', value: 'entirePlace'),
    TypeOfPlacesModel(label: 'Private room', value: 'privateRoom'),
    TypeOfPlacesModel(label: 'Shared room', value: 'sharedRoom'),
  ];
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          text: "Type of place",
          size: GSSizes.$sm,
        ),
        GSCheckBoxGroup(
            values: [
              _typeOfPlacesData[0].value,
            ],
            child: GSVStack(
              space: GSSpaces.$lg,
              children: [
                for (int i = 0; i < _typeOfPlacesData.length; i++)
                  GSCheckBox(
                    size: GSSizes.$sm,
                    onChanged: (value) {},
                    icon: GSCheckBoxIndicator(
                        style: GSStyle(
                            margin: const EdgeInsets.only(right: $GSSpace.$3)),
                        child: const GSCheckBoxIcon()),
                    value: _typeOfPlacesData[i].value,
                    label: GSCheckBoxLabel(text: _typeOfPlacesData[i].label),
                  ),
              ],
            ))
      ],
    );
  }
}
