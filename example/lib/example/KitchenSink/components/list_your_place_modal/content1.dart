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
      space: GSSpaces.$lg,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSVStack(
          space: GSSpaces.$xs,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GSText(
                bold: true, size: GSSizes.$sm, text: "I want to ....."),
            GSHStack(
              space: GSSpaces.$md,
              children: [
                GSButton(
                  size: GSSizes.$xs,
                  action:
                      isSellSelected ? GSActions.primary : GSActions.secondary,
                  variant: GSVariants.outline,
                  style: GSStyle(borderRadius: $GSRadii.full),
                  child: const GSButtonText(text: "Sell"),
                  onPressed: () {
                    setState(() {
                      isSellSelected = true;
                    });
                  },
                ),
                GSButton(
                  size: GSSizes.$xs,
                  action:
                      !isSellSelected ? GSActions.primary : GSActions.secondary,
                  variant: GSVariants.outline,
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
              space: GSSpaces.$md,
              children: [
                GSRadio<String>(
                  size: GSSizes.$lg,
                  style: GSStyle(
                      margin:  EdgeInsets.only(
                          right: $GSSpace.$3, left: $GSSpace.$1)),
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
                  size: GSSizes.$lg,
                  style: GSStyle(
                      margin:  EdgeInsets.only(
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
          space: GSSpaces.$md,
          children: [
            GSButton(
              size: GSSizes.$xs,
              action: selectedPropertyType[0]
                  ? GSActions.primary
                  : GSActions.secondary,
              variant: GSVariants.outline,
              style: GSStyle(borderRadius: $GSRadii.full),
              child: const GSButtonText(text: 'flat/apartment'),
              onPressed: () {
                setState(() {
                  selectedPropertyType[0] = !selectedPropertyType[0];
                });
              },
            ),
            GSButton(
              size: GSSizes.$xs,
              action: selectedPropertyType[1]
                  ? GSActions.primary
                  : GSActions.secondary,
              variant: GSVariants.outline,
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
          space: GSSpaces.$md,
          children: [
            GSButton(
              size: GSSizes.$xs,
              action: selectedPropertyType[2]
                  ? GSActions.primary
                  : GSActions.secondary,
              variant: GSVariants.outline,
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
              size: GSSizes.$xs,
              action: selectedPropertyType[3]
                  ? GSActions.primary
                  : GSActions.secondary,
              variant: GSVariants.outline,
              style: GSStyle(borderRadius: $GSRadii.full),
              child: const GSButtonText(text: 'Plot/Land'),
              onPressed: () {
                setState(() {
                  selectedPropertyType[3] = !selectedPropertyType[3];
                });
              },
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: GSButton(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.negative,
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
