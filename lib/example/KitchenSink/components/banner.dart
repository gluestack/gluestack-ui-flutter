import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_box/gs_box.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link.dart';
import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';

class KSBanner extends StatelessWidget {
  const KSBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        color: $GSColors.backgroundLight900,
        height: $GSSpace.$16,
        dark: GSStyle(color: Colors.red), //Error: Does not work
        // dark: GSStyle(color: $GSColors.backgroundDark800), //TODO: replace when the above works!
      ),
      child: GSHStack(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GSText(
            text: 'Show total prices up front',
            size: GSSizes.$sm,
            style: GSStyle(
              dark: GSStyle(
                textStyle: const TextStyle(color: $GSColors.textLight0),
              ),
              textStyle: const TextStyle(color: $GSColors.textLight0),
            ),
          ),
          const SizedBox(width: 10),
          GSLink(
              url: 'https://ui.gluestack.io/',
              style: GSStyle(
                  textStyle: const TextStyle(
                      color: $GSColors
                          .red600)), //Error: should not descendant style work here?
              text: GSLinkText(
                text: "Learn More",
                style: GSStyle(
                    textStyle: const TextStyle(color: $GSColors.textLight0),
                    dark: GSStyle(
                      textStyle: const TextStyle(color: $GSColors.textDark200),
                    )),
              ))
        ],
      ),
    );
  }
}
