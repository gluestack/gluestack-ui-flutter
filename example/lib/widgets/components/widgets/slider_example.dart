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
    GSOrientations.vertical,
    GSOrientations.horizontal,
  ];
  GSOrientations selectedOrientationOption = GSOrientations.horizontal;

  final List dropdownVariantOptions = [
    GSAccordionVariants.filled,
    GSAccordionVariants.unfilled,
  ];
  GSAccordionVariants selectedVariantOption = GSAccordionVariants.unfilled;

  bool isDisabled = false;
  bool isReversed = false;
  double currentValue = 5;

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
  size: $selectedSizeOption,
  isDisabled: $isDisabled,
  isReversed: $isReversed,
  orientation: $selectedOrientationOption,
  defaultValue: 3,
  minValue: 0,
  maxValue: 10,
  onChanged: (value) {
    setState(() {
      currentValue = value;
    });
  },    
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
          defaultValue: 3,
          minValue: 0,
          maxValue: 10,
          onChanged: (value) {
            setState(() {});
          },
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
