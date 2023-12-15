import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class IconPreview extends StatelessWidget {
  const IconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSSizes enum order.
    List<Option<int>> sizeOptions = [
      Option<int>(value: 1, label: GSSizes.$xs.name),
      Option<int>(value: 2, label: GSSizes.$sm.name),
      Option<int>(value: 3, label: GSSizes.$md.name),
      Option<int>(value: 4, label: GSSizes.$lg.name),
      Option<int>(value: 5, label: GSSizes.$xl.name),
    ];

    return Storybook(
      initialStory: 'Icon',
      stories: [
        Story(
          name: 'Icon',
          description:
              'Icons are often used to enhance the usability and accessibility of digital products by providing users with clear and intuitive visual cues. It serves as an intuitive and easily recognizable way to communicate with users.',
          builder: (context) => GSIcon(
            size: GSSizes.values[context.knobs
                .options(label: 'Size', initial: 3, options: sizeOptions)],
            icon: Icons.calendar_month,
          ),
        ),
      ],
    );
  }
}
