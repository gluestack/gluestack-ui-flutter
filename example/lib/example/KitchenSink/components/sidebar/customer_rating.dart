import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/models/customer_rating.dart';

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
    return VStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(
          text: "Customer Ratings",
          size: GSSizes.$sm,
        ),
        CheckBoxGroup(
            child: VStack(
          space: GSSpaces.$lg,
          children: [
            for (int i = 0; i < _customerRatingData.length; i++)
              CheckBox(
                size: GSSizes.$sm,
                onChanged: (value) {},
                icon: CheckBoxIndicator(
                    style: GSStyle(
                        margin: const EdgeInsets.only(right: $GSSpace.$2)),
                    child: const CheckBoxIcon()),
                value: _customerRatingData[i].value,
                label: HStack(
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
