import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';
import 'package:gluestack_ui_example/widgets/drop_down.dart';

class ToastExample extends StatefulWidget {
  const ToastExample({super.key});

  @override
  State<ToastExample> createState() => _ToastExampleState();
}

class _ToastExampleState extends State<ToastExample> {
  final List dropdownActionOptions = [
    GSToastActions.success,
    GSToastActions.info,
    GSToastActions.error,
    GSToastActions.warning,
    GSToastActions.attention,
  ];
  GSToastActions selectedActionOption = GSToastActions.attention;

  final List dropdownVariantOptions = [
    GSToastVariants.solid,
    GSToastVariants.outline,
    GSToastVariants.accent,
  ];
  GSToastVariants selectedVariantOption = GSToastVariants.solid;
  void updateVariantSelectedOption(dynamic newOption) {
    setState(() {
      selectedVariantOption = newOption;
    });
  }

  void updateActionSelectedOption(dynamic newOption) {
    setState(() {
      selectedActionOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
               GSToast(
                variant: GSToastVariants.solid,
                action: GSToastActions.attention,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GSToastTitle(
                      title: "Toast Title",
                    ),
                    GSToastDescription(
                      description: "Here is the toast description!",
                    ),
                  ],
                ),
              ),
''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Toast"),
      ),
      body: BaseLayout(
        code: code,
        component: GSButton(
          size: GSButtonSizes.$lg,
          child: const GSButtonText(text: "Click Me"),
          onPressed: () {
            showToast(
              context,
              child: GSToast(
                variant: selectedVariantOption,
                action: selectedActionOption,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GSToastTitle(
                      title: "Toast Title",
                    ),
                    GSToastDescription(
                      description: "Here is the toast description!",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "variant",
              dropdownOptions: dropdownVariantOptions,
              selectedOption: selectedVariantOption,
              onChanged: updateVariantSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomDropDown(
              title: "action",
              dropdownOptions: dropdownActionOptions,
              selectedOption: selectedActionOption,
              onChanged: updateActionSelectedOption,
            ),
          ],
        ),
      ),
    );
  }
}
