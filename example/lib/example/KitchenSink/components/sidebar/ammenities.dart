import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/models/ammenities.dart';

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
    return VStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(
          text: "Ammenities",
          size: GSSizes.$sm,
        ),
        CheckBoxGroup(
            values: [
              _ammenitiesData[0].value,
              _ammenitiesData[2].value,
            ],
            child: VStack(
              crossAxisAlignment: CrossAxisAlignment.start,
              space: GSSpaces.$lg,
              children: [
                for (int i = 0;
                    i < (showMore ? 5 : _ammenitiesData.length);
                    i++)
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
        GSPressable(
            onPress: () {
              setState(() {
                showMore = !showMore;
              });
            },
            child: HStack(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GSText(
                    style: GSStyle(
                        dark: GSStyle(
                            textStyle:
                                const TextStyle(color: $GSColors.textDark300))),
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
