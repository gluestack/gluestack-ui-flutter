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
        style: GSStyle(
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
                    style: GSStyle(color: $GSColors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GSButtonText(
                    text: "Left Icon",
                    style: GSStyle(),
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
                    style: GSStyle(),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GSIcon(
                    icon: Icons.add,
                    style: GSStyle(color: $GSColors.white),
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
