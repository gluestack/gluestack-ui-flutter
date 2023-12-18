import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ProgressPreview extends StatelessWidget {
  const ProgressPreview({super.key});

  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSSizes enum order.
    List<Option<int>> sizeOptions = [
      Option<int>(value: 1, label: GSSizes.$xs.name),
      Option<int>(value: 2, label: GSSizes.$sm.name),
      Option<int>(value: 3, label: GSSizes.$md.name),
      Option<int>(value: 4, label: GSSizes.$lg.name),
      Option<int>(value: 5, label: GSSizes.$xl.name),
      Option<int>(value: 6, label: GSSizes.$2xl.name),
    ];

    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Progress',
        stories: [
          Story(
            name: 'Progress',
            builder: (context) => GSProgress(
              size: GSSizes.values[context.knobs
                  .options(label: 'Size', initial: 3, options: sizeOptions)],
              value: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
