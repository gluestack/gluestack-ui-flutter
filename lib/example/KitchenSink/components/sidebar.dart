import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_switch/gs_switch.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSSideBar extends StatefulWidget {
  const KSSideBar({super.key});

  @override
  State<KSSideBar> createState() => _KSSideBarState();
}

class _KSSideBarState extends State<KSSideBar> {
  bool switchVal1 = false;
  bool switchVal2 = false;
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSHeading(
          text: "Booking Option",
          size: GSSizes.$sm,
        ),
        const SizedBox(height: 20),
        GSHStack(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GSVStack(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GSText(
                  text: "Self check-in",
                  size: GSSizes.$sm,
                  style: GSStyle(
                      textStyle: TextStyle(color: $GSColors.textLight900),
                      dark: GSStyle(
                        textStyle: TextStyle(
                            color: $GSColors
                                .textDark100), //Error: No default value to fall back on??
                      )),
                ),
                GSText(
                  text: "Access a place without needing the Host",
                  size: GSSizes.$xs,
                  style: GSStyle(
                    textStyle: TextStyle(color: $GSColors.textLight500),
                  ),
                  softWrap: true,
                  maxLines: 3,
                ),
              ],
            ),
            GSSwitch(
              size: GSSizes.$sm,
              value: switchVal1,
              onToggle: (val) {
                setState(() {
                  switchVal1 = val;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        //switch 2---------------------------
        GSHStack(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GSVStack(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GSText(
                  text: "Meals included",
                  size: GSSizes.$sm,
                  style: GSStyle(
                      textStyle: TextStyle(color: $GSColors.textLight900),
                      dark: GSStyle(
                        textStyle: TextStyle(
                            color: $GSColors
                                .textDark100), //Error: No default value to fall back on??
                      )),
                ),
                GSText(
                  text: "Have a prefered meal for your comfy stay",
                  size: GSSizes.$xs,
                  style: GSStyle(
                    textStyle: TextStyle(color: $GSColors.textLight500),
                  ),
                  softWrap: true,
                  maxLines: 3,
                ),
              ],
            ),
            GSSwitch(
              size: GSSizes.$sm,
              value: switchVal2,
              onToggle: (val) {
                setState(() {
                  switchVal2 = val;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
