import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/utils/drop_down.dart';
import 'package:gluestack_flutter_pro/utils/toggle.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_text.dart';

/// Example widget demonstrating the usage of GSBadge, GSBadgeIcon, and GSBadgeText.
class BadgeExample extends StatefulWidget {
  const BadgeExample({super.key});

  @override
  State<BadgeExample> createState() => _BadgeExampleState();
}

class _BadgeExampleState extends State<BadgeExample> {
  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];
  GSSizes selectedSizeOption = GSSizes.$md;

  final List dropdownVariantOptions = [
    GSVariants.solid,
    GSVariants.outline,
  ];
  GSVariants selectedVariantOption = GSVariants.solid;

  final List dropdownRadiusOptions = [
    GSBorderRadius.$none,
    GSBorderRadius.$xs,
    GSBorderRadius.$sm,
    GSBorderRadius.$md,
    GSBorderRadius.$lg,
    GSBorderRadius.$xl,
    GSBorderRadius.$2xl,
    GSBorderRadius.$3xl,
    GSBorderRadius.$full,
  ];
  GSBorderRadius selectedRadiusOption = GSBorderRadius.$full;

  final List dropdownActionOptions = [
    GSActions.error,
    GSActions.warning,
    GSActions.success,
    GSActions.info,
    GSActions.muted,
  ];
  GSActions selectedActionOption = GSActions.success;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  void updateVariantSelectedOption(dynamic newOption) {
    setState(() {
      selectedVariantOption = newOption;
    });
  }

  void updateRadiusSelectedOption(dynamic newOption) {
    setState(() {
      selectedRadiusOption = newOption;
    });
  }

  void updateActionSelectedOption(dynamic newOption) {
    setState(() {
      selectedActionOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSBadge(
              action: selectedActionOption,
              variant: selectedVariantOption,
              icon: const GSBadgeIcon(
                iconData: Icons.info_outline,
              ),
              text: const GSBadgeText(
                'information',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropDown(
                  title: "size",
                  dropdownOptions: dropdownSizeOptions,
                  selectedOption: selectedSizeOption,
                  onChanged: updateSizeSelectedOption,
                ),
                CustomDropDown(
                  title: "variant",
                  dropdownOptions: dropdownVariantOptions,
                  selectedOption: selectedVariantOption,
                  onChanged: updateVariantSelectedOption,
                ),
                CustomDropDown(
                  title: "borderRadius",
                  dropdownOptions: dropdownRadiusOptions,
                  selectedOption: selectedRadiusOption,
                  onChanged: updateRadiusSelectedOption,
                ),
                CustomDropDown(
                  title: "action",
                  dropdownOptions: dropdownActionOptions,
                  selectedOption: selectedActionOption,
                  onChanged: updateActionSelectedOption,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
