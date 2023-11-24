import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';

import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

import 'package:provider/provider.dart';

class ListYourPlaceModal1 extends StatelessWidget {
  const ListYourPlaceModal1({super.key});

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
                    action: GSActions.secondary,
                    variant: GSVariants.outline,
                    style: GSStyle(borderRadius: 999),
                    child: const GSButtonText(text: "Sell"),
                    onPressed: () {},
                  ),
                  GSButton(
                    action: GSActions.negative,
                    variant: GSVariants.outline,
                    style: GSStyle(borderRadius: 999),
                    child: const GSButtonText(text: "Rent/Lease"),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
