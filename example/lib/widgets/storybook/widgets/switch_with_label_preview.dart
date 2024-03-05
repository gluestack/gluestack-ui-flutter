import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SwitchWithLabelPreview extends StatefulWidget {
  const SwitchWithLabelPreview({super.key});

  @override
  State<SwitchWithLabelPreview> createState() => _SwitchWithLabelPreviewState();
}

class _SwitchWithLabelPreviewState extends State<SwitchWithLabelPreview> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
          initialStory: 'Switch',
          initialLayout: Layout.compact,
          stories: [
            Story(
                name: 'Switch',
                builder: (context) => GSBox(
                      style: GSStyle(width: 150, height: 200),
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
                          const GSText(text: 'Allow notifications')
                        ],
                      ),
                    ))
          ]),
    );
  }
}
