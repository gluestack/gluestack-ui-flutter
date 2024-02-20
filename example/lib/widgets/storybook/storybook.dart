import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'widgets/public.dart';

class StorybookWidget extends ConsumerStatefulWidget {
  const StorybookWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StorybookWidgetState();
}

class _StorybookWidgetState extends ConsumerState<StorybookWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    return materialWrapper(
      context,
      Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(title: const Text('Storybook')),
        body: Storybook(
          initialLayout: Layout.expanded,
          initialStory: 'Alert Dialog',
          stories: kStories.map((item) => item.story),
        ),
      ),
    );
  }
}
