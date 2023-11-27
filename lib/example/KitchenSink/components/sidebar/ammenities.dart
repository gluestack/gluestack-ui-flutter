import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/models/ammenities.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
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
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          text: "Ammenities",
          size: GSSizes.$sm,
        ),
        GSCheckBoxGroup(
            values: [
              _ammenitiesData[0].value,
              _ammenitiesData[2].value,
            ],
            child: GSVStack(
              space: GSSpaces.$lg,
              children: [
                for (int i = 0;
                    i < (showMore ? 5 : _ammenitiesData.length);
                    i++)
                  GSCheckBox(
                    size: GSSizes.$sm,
                    onChanged: (value) {},
                    icon: GSCheckBoxIndicator(
                        style: GSStyle(
                            margin: const EdgeInsets.only(right: $GSSpace.$3)),
                        child: const GSCheckBoxIcon()),
                    value: _ammenitiesData[i].value,
                    label: GSCheckBoxLabel(text: _ammenitiesData[i].label),
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
                    style: GSStyle(
                        dark: GSStyle(
                            textStyle:
                                TextStyle(color: $GSColors.textDark300))),
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
