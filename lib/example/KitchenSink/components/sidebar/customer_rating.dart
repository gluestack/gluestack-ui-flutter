import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/models/customer_rating.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

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
  KSCustomerRating({super.key});

  final List<CustomerRatingModel> _customerRatingData = [
    CustomerRatingModel(
      label: "5 stars",
      value: "5 stars",
    ),
    CustomerRatingModel(
      label: "4+ stars",
      value: "5+ stars",
    ),
    CustomerRatingModel(
      label: "3+ stars",
      value: "3+ stars",
    ),
    CustomerRatingModel(
      label: "2+ stars",
      value: "2+ stars",
    ),
  ];

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
            for (int i = 0; i < _customerRatingData.length; i++)
              GSCheckBox(
                size: GSSizes.$sm,
                onChanged: (value) {},
                icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin: const EdgeInsets.only(right: $GSSpace.$2)),
                    child: const GSCheckBoxIcon()),
                value: _customerRatingData[i].value,
                label: GSHStack(
                  space: GSSpaces.$xs,
                  children: [
                    GSIcon(
                      style: GSStyle(
                          width: 12,
                          color: $GSColors.black,
                          dark: GSStyle(color: $GSColors.white)),
                      icon: Icons.star,
                    ),
                    GSCheckBoxLabel(text: _customerRatingData[i].label)
                  ],
                ),
              ),
          ],
        ))
      ],
    );
  }
}
