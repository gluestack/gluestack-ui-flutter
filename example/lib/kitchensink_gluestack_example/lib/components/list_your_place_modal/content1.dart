import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class ListYourPlaceModalContent1 extends StatefulWidget {
  final Function nextFunction;
  const ListYourPlaceModalContent1({super.key, required this.nextFunction});

  @override
  State<ListYourPlaceModalContent1> createState() =>
      _ListYourPlaceModalContent1State();
}

class _ListYourPlaceModalContent1State
    extends State<ListYourPlaceModalContent1> {
  bool isSellSelected = true;
  List<bool> selectedPropertyType = List.generate(4, (index) => false);
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSVstackSpaces.$lg,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSVStack(
          space: GSVstackSpaces.$xs,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GSText(bold: true, size: GSSizes.$sm, text: "I want to..."),
            GSHStack(
              space: GSHstackSpaces.$md,
              children: [
                GSButton(
                  size: GSButtonSizes.$xs,
                  action:
                      isSellSelected ? GSButtonActions.primary : GSButtonActions.secondary,
                  variant: GSButtonVariants.outline,
                  style: GSStyle(borderRadius: $GSRadii.full),
                  child: const GSButtonText(text: "Sell"),
                  onPressed: () {
                    setState(() {
                      isSellSelected = true;
                    });
                  },
                ),
                GSButton(
                  size: GSButtonSizes.$xs,
                  action:
                      !isSellSelected ? GSButtonActions.primary : GSButtonActions.secondary,
                  variant: GSButtonVariants.outline,
                  style: GSStyle(borderRadius: $GSRadii.full),
                  child: const GSButtonText(text: "Rent/Lease"),
                  onPressed: () {
                    setState(() {
                      isSellSelected = false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        GSVStack(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GSText(bold: true, size: GSSizes.$sm, text: "Property is..."),
            GSHStack(
              space: GSHstackSpaces.$md,
              children: [
                GSRadio<String>(
                  size: GSRadioSizes.$lg,
                  style: GSStyle(
                      margin: EdgeInsets.only(
                    right: $GSSpace.$3,
                  )),
                  icon: const GSRadioIcon<String>(),
                  groupValue: '1',
                  value: '1',
                  label: const GSRadioText<String>(text: "Residential"),
                  onChanged: (value) {
                    setState(() {
                      // currentSelectedOption = value!;
                    });
                  },
                ),
                GSRadio<String>(
                  size: GSRadioSizes.$lg,
                  style: GSStyle(
                      margin: EdgeInsets.only(
                          right: $GSSpace.$3, left: $GSSpace.$1)),
                  icon: const GSRadioIcon<String>(),
                  groupValue: '1',
                  value: '1',
                  label: const GSRadioText<String>(text: "Commercial"),
                  onChanged: (value) {
                    setState(() {
                      // currentSelectedOption = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        GSHStack(
          space: GSHstackSpaces.$md,
          children: [
            GSButton(
              size: GSButtonSizes.$xs,
              action: selectedPropertyType[0]
                  ? GSButtonActions.primary
                  : GSButtonActions.secondary,
              variant: GSButtonVariants.outline,
              style: GSStyle(borderRadius: $GSRadii.full),
              child: const GSButtonText(text: 'flat/apartment'),
              onPressed: () {
                setState(() {
                  selectedPropertyType[0] = !selectedPropertyType[0];
                });
              },
            ),
            GSButton(
              size: GSButtonSizes.$xs,
              action: selectedPropertyType[1]
                  ? GSButtonActions.primary
                  : GSButtonActions.secondary,
              variant: GSButtonVariants.outline,
              style: GSStyle(borderRadius: $GSRadii.full),
              child: const GSButtonText(text: 'independent house/villa'),
              onPressed: () {
                setState(() {
                  selectedPropertyType[1] = !selectedPropertyType[1];
                });
              },
            ),
          ],
        ),
        GSHStack(
          space: GSHstackSpaces.$md,
          children: [
            GSButton(
              size: GSButtonSizes.$xs,
              action: selectedPropertyType[2]
                  ? GSButtonActions.primary
                  : GSButtonActions.secondary,
              variant: GSButtonVariants.outline,
              style: GSStyle(borderRadius: $GSRadii.full),
              child:
                   const GSButtonText(text: 'independent floor/building floor'),
              onPressed: () {
                setState(() {
                  selectedPropertyType[2] = !selectedPropertyType[2];
                });
              },
            ),
            GSButton(
              size: GSButtonSizes.$xs,
              action: selectedPropertyType[3]
                  ? GSButtonActions.primary
                  : GSButtonActions.secondary,
              variant: GSButtonVariants.outline,
              style: GSStyle(borderRadius: $GSRadii.full),
              child:  const GSButtonText(text: 'Plot/Land'),
              onPressed: () {
                setState(() {
                  selectedPropertyType[3] = !selectedPropertyType[3];
                });
              },
            ),
          ],
        ),
        GSBox(
          style: GSStyle(width: double.maxFinite),
          child: GSButton(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSButtonActions.negative,
            child: const GSButtonText(text: 'Next'),
            onPressed: () {
              widget.nextFunction.call();
            },
          ),
        )
      ],
    );
  }
}
