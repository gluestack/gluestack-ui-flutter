import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ButtonWithIconsPreview extends StatelessWidget {
  const ButtonWithIconsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      GSBox(
        style: GlueStyle(
          width: 300,
          height: 100,
        ),
        child: GSVStack(
          children: [
            GSButton(
              child: GSHStack(
                children: [
                  GSIcon(
                    icon: Icons.edit,
                    style: GlueStyle(color: $GSColors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GSButtonText(
                    text: "Left Icon",
                    style: GlueStyle(),
                  ),
                ],
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            GSButton(
              child: GSHStack(
                children: [
                  GSButtonText(
                    text: "Right Icon",
                    style: GlueStyle(),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GSIcon(
                    icon: Icons.add,
                    style: GlueStyle(color: $GSColors.white),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
