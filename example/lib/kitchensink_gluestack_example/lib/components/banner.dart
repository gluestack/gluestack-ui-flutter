import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class KSBanner extends StatelessWidget {
  const KSBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        color: $GSColors.backgroundLight900,
        height: $GSSpace.$16,
        dark: GSStyle(color: $GSColors.backgroundDark800),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: GSHStack(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GSText(
              text: 'Show total prices up front ',
              size: GSSizes.$sm,
              style: GSStyle(
                dark: GSStyle(
                  textStyle: TextStyle(color: $GSColors.textLight0),
                ),
                textStyle: TextStyle(color: $GSColors.textLight0),
              ),
            ),
            GSBox(style: GSStyle(height: 10)),
            const GSLink(
              url: 'https://ui.gluestack.io/',
              text: GSLinkText(
                text: "Learn More",
              ),
            )
          ],
        ),
      ),
    );
  }
}
