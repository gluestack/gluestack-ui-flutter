import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/font_size_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSMainComponent extends StatelessWidget {
  const KSMainComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: GSVStack(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //r1
          GSHStack(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GSHeading(size: GSSizes.$xl, text: 'New this week'),
              Padding(
                padding: EdgeInsets.only(top: 9),
                child: GSButton(
                  variant: GSVariants.outline,
                  action: GSActions.secondary,
                  child: GSHStack(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GSButtonIcon(
                          icon: Icons.list,
                          iconSize: GSSizes.$xl,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GSButtonText(
                          text: 'List your place',
                          style: GSStyle(
                              textStyle: TextStyle(fontSize: $GSFontSize.$md)),
                        ),
                      ]),
                  onPressed: () {
                    //TODO: add pop up
                  },
                ),
              ),
            ],
          ),
          //r2
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GSHStack(
              children: [
                for (int i = 1; i < 10; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: GSImage(
                          fit: BoxFit.cover,
                          size: GSSizes.$2xl,
                          path: 'assets/images/image$i.png',
                          imageType: GSImageType.asset),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
