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
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSAmmenities extends StatefulWidget {
  const KSAmmenities({super.key});

  @override
  State<KSAmmenities> createState() => _KSAmmenitiesState();
}

class _KSAmmenitiesState extends State<KSAmmenities> {
  bool showMore = true;

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          text: "Ammenities",
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
              value: 'wifi',
              label: const GSCheckBoxLabel(text: 'Wifi'),
            ),
            GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$3)),
                  child: const GSCheckBoxIcon()),
              value: 'Washing machine',
              label: const GSCheckBoxLabel(text: 'Washing machine'),
            ),
            GSCheckBox(
              defaultIsChecked: true,
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$3)),
                  child: const GSCheckBoxIcon()),
              value: 'Air conditioning',
              label: const GSCheckBoxLabel(text: 'Air conditioning'),
            ),
            GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$3)),
                  child: const GSCheckBoxIcon()),
              value: 'Kitchen',
              label: const GSCheckBoxLabel(text: 'Kitchen'),
            ),
            GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$3)),
                  child: const GSCheckBoxIcon()),
              value: 'Dryer',
              label: const GSCheckBoxLabel(text: 'Dryer'),
            ),
            if (!showMore)
              GSCheckBox(
                defaultIsChecked: true,
                onChanged: (value) {},
                icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin: const EdgeInsets.only(right: $GSSpace.$3)),
                    child: const GSCheckBoxIcon()),
                value: 'Iron',
                label: const GSCheckBoxLabel(text: 'Iron'),
              ),
            GSCheckBox(
              onChanged: (value) {},
              icon: GSCheckBoxIndicator(
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$3)),
                  child: const GSCheckBoxIcon()),
              value: 'Hair Dryer',
              label: const GSCheckBoxLabel(text: 'Hair Dryer'),
            ),
          ],
        )),
        GSPressable(
            onPress: () {
              setState(() {
                showMore = !showMore;
              });
            },
            child: GSHStack(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GSText(
                    // size: GSSizes.$xs,
                    text: showMore ? 'Show more' : 'Show less'),
                GSIcon(
                    icon: showMore
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded)
              ],
            ))
      ],
    );
  }
}
