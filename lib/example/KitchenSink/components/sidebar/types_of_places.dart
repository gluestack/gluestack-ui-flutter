import 'package:flutter/material.dart';
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
  const KSTypesOfPlaces({super.key});

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
            child: GSVStack(
          space: GSSpaces.$lg,
          children: [
            GSCheckBox(
              onChanged: (value) {},
              defaultIsChecked: true,
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$3)),
                  child: const GSCheckBoxIcon()),
              value: 'Entire place',
              label: const GSCheckBoxLabel(text: 'Entire place'),
            ),
            GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$3)),
                  child: const GSCheckBoxIcon()),
              value: 'Private room',
              label: const GSCheckBoxLabel(text: 'Private room'),
            ),
            GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$3)),
                  child: const GSCheckBoxIcon()),
              value: 'Shared room',
              label: const GSCheckBoxLabel(text: 'Shared room'),
            ),
          ],
        ))
      ],
    );
  }
}
