import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/space_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_indicator.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_label.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSCustomerRating extends StatelessWidget {
  const KSCustomerRating({super.key});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          text: "Customer Ratings",
          size: GSSizes.$sm,
        ),
        GSCheckBoxGroup(
            child: GSVStack(
          space: GSSpaces.$lg,
          children: [
            GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$2)),
                  child: const GSCheckBoxIcon()),
              value: '5 stars',
              label: const GSHStack(
                space: GSSpaces.$xs,
                children: [
                  GSIcon(icon: Icons.star),
                  GSCheckBoxLabel(text: '5+ stars')
                ],
              ),
            ),
              GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$2)),
                  child: const GSCheckBoxIcon()),
              value: '4 stars',
              label: const GSHStack(
                space: GSSpaces.$xs,
                children: [
                  GSIcon(icon: Icons.star),
                  GSCheckBoxLabel(text: '4+ stars')
                ],
              ),
            ),
               GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$2)),
                  child: const GSCheckBoxIcon()),
              value: '3 stars',
              label: const GSHStack(
                space: GSSpaces.$xs,
                children: [
                  GSIcon(icon: Icons.star),
                  GSCheckBoxLabel(text: '3+ stars')
                ],
              ),
            ),
                 GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$2)),
                  child: const GSCheckBoxIcon()),
              value: '2 stars',
              label: const GSHStack(
                space: GSSpaces.$xs,
                children: [
                  GSIcon(icon: Icons.star),
                  GSCheckBoxLabel(text: '2+ stars')
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
