import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import '../layout/drop_down.dart';

class ImageExample extends StatefulWidget {
  const ImageExample({super.key});

  @override
  State<ImageExample> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample> {
  final List dropdownSizeOptions = [
    GSImageSizes.$2xs,
    GSImageSizes.$xs,
    GSImageSizes.$sm,
    GSImageSizes.$md,
    GSImageSizes.$lg,
    GSImageSizes.$xl,
    GSImageSizes.$2xl,
  ];
  GSImageSizes selectedSizeOption = GSImageSizes.$md;
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  final List dropdownRadiusOptions = [
    GSImageRadius.$none,
    GSImageRadius.$xs,
    GSImageRadius.$sm,
    GSImageRadius.$md,
    GSImageRadius.$lg,
    GSImageRadius.$xl,
    GSImageRadius.$2xl,
    GSImageRadius.$3xl,
    GSImageRadius.$full,
  ];
  GSImageRadius selectedRadiusOption = GSImageRadius.$full;
  void updateRadiusSelectedOption(dynamic newOption) {
    setState(() {
      selectedRadiusOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
            GSImage(
                size: GSSizes.\$md,
                borderRadius: GSBorderRadius.\$full,
                path:
                    'https://plus.unsplash.com/premium_photo-1697211174198-18da849f87c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5OTI2NTM4Mg&ixlib=rb-4.0.3&q=80&w=1080',
                imageType: GSImageType.network,
             )
  ''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Image",
          size: GSSizes.$xl,
        ),
      ),
      body: BaseLayout(
        code: code,
        component: GSImage(
            size: selectedSizeOption,
            borderRadius: selectedRadiusOption,
            path:
                'https://plus.unsplash.com/premium_photo-1697211174198-18da849f87c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5OTI2NTM4Mg&ixlib=rb-4.0.3&q=80&w=1080',
            imageType: GSImageType.network),
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
              title: "borderRadius",
              dropdownOptions: dropdownRadiusOptions,
              selectedOption: selectedRadiusOption,
              onChanged: updateRadiusSelectedOption,
            ),
          ],
        ),
      ),
    );
  }
}
