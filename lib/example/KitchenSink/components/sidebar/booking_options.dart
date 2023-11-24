import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_switch/gs_switch.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSBookingOptions extends StatefulWidget {
  const KSBookingOptions({super.key});

  @override
  State<KSBookingOptions> createState() => _KSBookingOptionsState();
}

class _KSBookingOptionsState extends State<KSBookingOptions> {
  bool switchVal1 = false;
  bool switchVal2 = false;
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          text: "Booking Option",
          size: GSSizes.$sm,
        ),

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
                      textStyle: const TextStyle(color: $GSColors.textLight900),
                      dark: GSStyle(
                        textStyle: const TextStyle(
                            color: $GSColors
                                .textDark100), //Error: No default value to fall back on??
                      )),
                ),
                GSText(
                  text: "Access a place without needing the Host",
                  size: GSSizes.$xs,
                  style: GSStyle(
                    textStyle: const TextStyle(color: $GSColors.textLight500),
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
                      textStyle: const TextStyle(color: $GSColors.textLight900),
                      dark: GSStyle(
                        textStyle: const TextStyle(
                            color: $GSColors
                                .textDark100), //Error: No default value to fall back on??
                      )),
                ),
                GSText(
                  text: "Have a prefered meal for your comfy stay",
                  size: GSSizes.$xs,
                  style: GSStyle(
                    textStyle: const TextStyle(color: $GSColors.textLight500),
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
        ),
      ],
    );
  }
}
