import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StorybookWidget extends ConsumerStatefulWidget {
  const StorybookWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StorybookWidgetState();
}

class _StorybookWidgetState extends ConsumerState<StorybookWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storybook')),
      body: Center(
        child: Storybook(
          initialLayout: Layout.expanded,
          wrapperBuilder: (BuildContext _, Widget? child) =>
              Container(child: child),
          stories: [],
        ),
      ),
    );
  }
}
