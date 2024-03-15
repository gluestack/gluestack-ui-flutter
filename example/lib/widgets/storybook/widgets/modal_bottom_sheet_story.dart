import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> dropdownBorderRadiusOptions = [
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

final class ModalBottomSheetStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSButton(
        size: GSButtonSizes.$lg,
        child: const GSButtonText(text: "Open Bottom Sheet"),
        onPressed: () {
          GSModalBottomSheet.showModalBottomSheet<void>(
            borderRadius: GSBorderRadius.$3xl,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const GSText(text: "MODAL BOTTOM SHEET"),
                      const SizedBox(
                        height: 100,
                      ),
                      GSButton(
                        variant: GSButtonVariants.outline,
                        size: GSButtonSizes.$md,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const GSButtonText(text: "Close"),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  String get routePath => "modal_bottom_sheet-preview";

  @override
  String get storyName => "Modal Bottom Sheet";
}
