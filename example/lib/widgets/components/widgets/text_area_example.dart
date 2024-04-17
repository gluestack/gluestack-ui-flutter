import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import '../layout/drop_down.dart';
import '../layout/toggle.dart';

class TextAreaExample extends StatefulWidget {
  const TextAreaExample({super.key});

  @override
  State<TextAreaExample> createState() => _TextAreaExampleState();
}

class _TextAreaExampleState extends State<TextAreaExample> {
  TextEditingController textEditingController = TextEditingController();
  final List dropdownSizeOptions = [
    GSTextAreaSizes.$sm,
    GSTextAreaSizes.$md,
    GSTextAreaSizes.$lg,
    GSTextAreaSizes.$xl,
  ];
  GSTextAreaSizes selectedSizeOption = GSTextAreaSizes.$md;

  bool isDisabled = false;
  bool isInvalid = false;
  bool isReadOnly = false;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
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
          GSTextArea(
                size: GSTextAreaSizes.\$md,
                hintText: "Enter text here",
                isDisabled: false,
                isInvalid: false,
                readOnly: false,
           )
  ''';
    return CustomGSLayout(
      title: "Text Area",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSTextArea(
          size: selectedSizeOption,
          isDisabled: isDisabled,
          isReadOnly: isReadOnly,
          isInvalid: isInvalid,
          controller: textEditingController,
          hintText: "Enter text here",
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
