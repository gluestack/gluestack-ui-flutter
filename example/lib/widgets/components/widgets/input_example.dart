import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import '../layout/drop_down.dart';
import '../layout/toggle.dart';

class InputExample extends StatefulWidget {
  const InputExample({super.key});

  @override
  State<InputExample> createState() => _InputExampleState();
}

class _InputExampleState extends State<InputExample> {
  TextEditingController textEditingController = TextEditingController();
  final List dropdownSizeOptions = [
    GSInputSizes.$sm,
    GSInputSizes.$md,
    GSInputSizes.$lg,
    GSInputSizes.$xl,
  ];
  GSInputSizes selectedSizeOption = GSInputSizes.$md;

  final List dropdownVariantOptions = [
    GSInputVariants.outline,
    GSInputVariants.rounded,
    GSInputVariants.underlined,
  ];
  GSInputVariants selectedVariantOption = GSInputVariants.outline;

  bool isDisabled = false;
  bool isInvalid = false;
  bool isReadOnly = false;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  void updateVariantSelectedOption(dynamic newOption) {
    setState(() {
      selectedVariantOption = newOption;
    });
  }

  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  void updateIsInvalid(bool value) {
    setState(() {
      isInvalid = value;
    });
  }

  void updateIsReadOnly(bool value) {
    setState(() {
      isReadOnly = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
      GSInput(
          size: GSInputSizes.\$md,
          variant: GSInputVariants.outline,
          hintText: "Enter text here",
          isDisabled: false,
          isInvalid: false,
          readOnly: false,
          style: GlueStyle(
                width: 300,
          ),
       )
  ''';
    return CustomGSLayout(
      title: "Input",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSInput(
          size: selectedSizeOption,
          variant: selectedVariantOption,
          hintText: "Enter text here",
          isDisabled: isDisabled,
          isInvalid: isInvalid,
          controller: textEditingController,
          isReadOnly: isReadOnly,
          style: GSStyle(
            width: 300,
          ),
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "size",
              dropdownOptions: dropdownSizeOptions,
              selectedOption: selectedSizeOption,
              onChanged: updateSizeSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomDropDown(
              title: "variant",
              dropdownOptions: dropdownVariantOptions,
              selectedOption: selectedVariantOption,
              onChanged: updateVariantSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isInvalid",
              value: isInvalid,
              onToggle: updateIsInvalid,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isReadOnly",
              value: isReadOnly,
              onToggle: updateIsReadOnly,
            )
          ],
        ),
      ),
    );
  }
}
