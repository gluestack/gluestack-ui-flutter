import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';
import 'package:gluestack_ui_example/widgets/components/layout/toggle.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  final List dropdownSizeOptions = [
    GSSliderSizes.$sm,
    GSSliderSizes.$md,
    GSSliderSizes.$lg
  ];
  GSSliderSizes selectedSizeOption = GSSliderSizes.$md;

  final List dropdownOrientationOptions = [
    GSSliderOrientation.$vertical,
    GSSliderOrientation.$horizontal,
  ];
  GSSliderOrientation selectedOrientationOption =
      GSSliderOrientation.$horizontal;

  final List dropdownVariantOptions = [
    GSAccordionVariants.filled,
    GSAccordionVariants.unfilled,
  ];
  GSAccordionVariants selectedVariantOption = GSAccordionVariants.unfilled;

  bool isDisabled = false;
  bool isReversed = false;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  void updateOrientationSelectedOption(dynamic newOption) {
    setState(() {
      selectedOrientationOption = newOption;
    });
  }

  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  void updateisReversed(bool value) {
    setState(() {
      isReversed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
GSSlider(
          
),
  ''';

    return CustomGSLayout(
      title: "Slider",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSSlider(
          size: selectedSizeOption,
          isDisabled: isDisabled,
          isReversed: isReversed,
          orientation: selectedOrientationOption,
          onChanged: (value) {
            setState(() {
              print(value);
            });
          },
          // min: 1,
          // max: 10,
          value: 2,
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
              title: "orientation",
              dropdownOptions: dropdownOrientationOptions,
              selectedOption: selectedOrientationOption,
              onChanged: updateOrientationSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isReversed",
              value: isReversed,
              onToggle: updateisReversed,
            )
          ],
        ),
      ),
    );
  }
}
