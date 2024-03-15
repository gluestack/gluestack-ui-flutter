import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

class BottomModalSheetExample extends StatefulWidget {
  const BottomModalSheetExample({super.key});

  @override
  State<BottomModalSheetExample> createState() =>
      _BottomModalSheetExampleState();
}

class _BottomModalSheetExampleState extends State<BottomModalSheetExample> {
  final List dropdownBorderRadiusOptions = [
    GSBorderRadius.$none,
    GSBorderRadius.$xs,
    GSBorderRadius.$sm,
    GSBorderRadius.$md,
    GSBorderRadius.$lg,
    GSBorderRadius.$xl,
    GSBorderRadius.$2xl,
    GSBorderRadius.$3xl,
    GSBorderRadius.$full
  ];
  GSBorderRadius selectedBorderRadiusOption = GSBorderRadius.$3xl;

  void updateBorderRadiusSelectedOption(dynamic newOption) {
    setState(() {
      selectedBorderRadiusOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
  GSButton(
  size: GSButtonSizes.\$lg,
  child: const GSButtonText(text: "Open Bottom Sheet"),
  onPressed: () {
    GSModalBottomSheet.showModalBottomSheet<void>(
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
                  size: GSButtonSizes.\$md,
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

''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Modal Bottom Sheet",
          size: GSSizes.$xl,
        ),
      ),
      body: BaseLayout(
        code: code,
        component: Center(
          child: GSButton(
            size: GSButtonSizes.$lg,
            child: const GSButtonText(text: "Open Bottom Sheet"),
            onPressed: () {
              GSModalBottomSheet.showModalBottomSheet<void>(
                borderRadius: selectedBorderRadiusOption,
                showDragHandle: true,
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
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "borderRadius",
              dropdownOptions: dropdownBorderRadiusOptions,
              selectedOption: selectedBorderRadiusOption,
              onChanged: updateBorderRadiusSelectedOption,
            ),
          ],
        ),
      ),
    );
  }
}