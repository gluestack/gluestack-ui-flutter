import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:provider/provider.dart';

class ToastExample extends StatefulWidget {
  const ToastExample({super.key});

  @override
  State<ToastExample> createState() => _ToastExampleState();
}

class _ToastExampleState extends State<ToastExample> {
  final List dropdownActionOptions = [
    GSActions.success,
    GSActions.info,
    GSActions.error,
    GSActions.warning,
    GSActions.attention,
  ];
  GSActions selectedActionOption = GSActions.attention;

  final List dropdownVariantOptions = [
    GSVariants.solid,
    GSVariants.outline,
    GSVariants.accent,
  ];
  GSVariants selectedVariantOption = GSVariants.solid;
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    var code = '''GSButton(
            size: GSSizes.\$lg,
            child: const GSButtonText(text: "Click Me"),
            onPressed: () {
              showToast(
                context,
                child: GSToast(
                  variant: GSVariants.solid,
                  action: GSActions.attention,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GSToastTitle(
                        title: "Hey",
                      ),
                      GSToastDescription(
                        description: "Desc Desc Desc Desc Desc Desc ",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
''';
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSButton(
            size: GSSizes.$lg,
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
                        title: "Hey",
                      ),
                      GSToastDescription(
                        description: "Desc Desc Desc Desc Desc Desc ",
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
              CustomDropDown(
                title: "action",
                dropdownOptions: dropdownActionOptions,
                selectedOption: selectedActionOption,
                onChanged: updateActionSelectedOption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
