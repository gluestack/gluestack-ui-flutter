import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SwitchCheckedStatePreview extends StatefulWidget {
  const SwitchCheckedStatePreview({super.key});

  @override
  State<SwitchCheckedStatePreview> createState() =>
      _SwitchCheckedStatePreviewState();
}

class _SwitchCheckedStatePreviewState extends State<SwitchCheckedStatePreview> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(initialStory: 'Switch', stories: [
        Story(
            name: 'Switch',
            builder: (context) => GSBox(
                  style: GlueStyle(width: 200, height: 100),
                  child: GSHStack(
                    children: [
                      GSSwitch(
                          value: isSelected,
                          onToggle: (value) {
                            setState(() {
                              isSelected = value;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const GSText(text: 'Public profile')
                    ],
                  ),
                ))
      ]),
    );
  }
}
