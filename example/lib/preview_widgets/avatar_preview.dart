import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AvatarPreview extends StatelessWidget {
  const AvatarPreview({super.key});

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

    //Need to add value according to GSSizes enum order.
    List<Option<int>> borderRadiusOptions = [
      Option<int>(value: 0, label: GSBorderRadius.$none.name),
      Option<int>(value: 1, label: GSBorderRadius.$xs.name),
      Option<int>(value: 2, label: GSBorderRadius.$sm.name),
      Option<int>(value: 3, label: GSBorderRadius.$md.name),
      Option<int>(value: 4, label: GSBorderRadius.$lg.name),
      Option<int>(value: 5, label: GSBorderRadius.$xl.name),
      Option<int>(value: 6, label: GSBorderRadius.$2xl.name),
      Option<int>(value: 7, label: GSBorderRadius.$3xl.name),
      Option<int>(value: 8, label: GSBorderRadius.$full.name),
    ];

    return Storybook(
      initialStory: 'Avatar',
      stories: [
        Story(
          name: 'Avatar',
          description:
              'The Avatar component is a versatile UI element representing a user with profile pictures, initials, or a fallback icon.',
          builder: (context) => GSAvatar(
            size: GSSizes.values[context.knobs
                .options(label: 'Size', initial: 3, options: sizeOptions)],
            radius: GSBorderRadius.values[context.knobs.options(
                label: 'Border Radius',
                initial: 8,
                options: borderRadiusOptions)],
            fallBackText: const GSAvatarFallBackText('Geeky Stack'),
          ),
        ),
      ],
    );
  }
}
