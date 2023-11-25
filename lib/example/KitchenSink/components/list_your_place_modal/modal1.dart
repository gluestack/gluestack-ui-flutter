import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';

import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

import 'package:provider/provider.dart';

class ListYourPlaceModal1 extends StatefulWidget {
  const ListYourPlaceModal1({super.key});

  @override
  State<ListYourPlaceModal1> createState() => _ListYourPlaceModal1State();
}

class _ListYourPlaceModal1State extends State<ListYourPlaceModal1> {
  bool isSellSelected = true;
  List<bool> selectedPropertyType = List.generate(4, (index) => false);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AlertDialog(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      title: GSHStack(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const GSHeading(size: GSSizes.$sm, text: "List your place"),
          GSPressable(
              onPress: () {
                Navigator.of(context).pop();
              },
              child: GSIcon(icon: Icons.close)),
        ],
      ),
      content: GSVStack(
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
                    action: isSellSelected
                        ? GSActions.primary
                        : GSActions.secondary,
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
                    action: !isSellSelected
                        ? GSActions.primary
                        : GSActions.secondary,
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
              const GSText(
                  bold: true, size: GSSizes.$sm, text: "Property is..."),
              GSHStack(
                space: GSSpaces.$md,
                children: [
                  GSRadio<String>(
                    style: GSStyle(
                        margin: const EdgeInsets.only(
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
                    style: GSStyle(
                        margin: const EdgeInsets.only(
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
                action:
                    selectedPropertyType[1] ? GSActions.primary : GSActions.secondary,
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
                action:
                    selectedPropertyType[2] ? GSActions.primary : GSActions.secondary,
                variant: GSVariants.outline,
                style: GSStyle(borderRadius: $GSRadii.full),
                child: const GSButtonText(
                    text: 'independent floor/building floor'),
                onPressed: () {
                  setState(() {
                     selectedPropertyType[2] = !selectedPropertyType[2];
                  });
                },
              ),
              GSButton(
                size: GSSizes.$xs,
                action:
                    selectedPropertyType[3]? GSActions.primary : GSActions.secondary,
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
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
