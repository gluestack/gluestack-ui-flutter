import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

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
      space: GSVstackSpaces.$lg,
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
            Expanded(
              child: GSVStack(
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
                  const GSText(
                    text: "Access a place without needing the Host",
                    size: GSSizes.$xs,
                    softWrap: true,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            GSSwitch(
              size: GSSwitchSizes.$sm,
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
            Expanded(
              child: GSVStack(
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
                  const GSText(
                    text: "Have a prefered meal for your comfy stay",
                    size: GSSizes.$xs,
                    softWrap: true,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            GSSwitch(
              size: GSSwitchSizes.$sm,
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
