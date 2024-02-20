import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/drop_down.dart';
import '../widgets/components/layout/base_layout.dart';

class AvatarExample extends StatefulWidget {
  const AvatarExample({super.key});

  @override
  State<AvatarExample> createState() => _AvatarExampleState();
}

class _AvatarExampleState extends State<AvatarExample> {
  final List dropdownSizeOptions = [
    GSAvatarSizes.$xs,
    GSAvatarSizes.$sm,
    GSAvatarSizes.$md,
    GSAvatarSizes.$lg,
    GSAvatarSizes.$xl,
    GSAvatarSizes.$2xl,
  ];
  GSAvatarSizes selectedSizeOption = GSAvatarSizes.$md;
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  final List dropdownRadiusOptions = [
    GSAvatarRadius.$none,
    GSAvatarRadius.$xs,
    GSAvatarRadius.$sm,
    GSAvatarRadius.$md,
    GSAvatarRadius.$lg,
    GSAvatarRadius.$xl,
    GSAvatarRadius.$2xl,
    GSAvatarRadius.$3xl,
    GSAvatarRadius.$full,
  ];
  GSAvatarRadius selectedRadiusOption = GSAvatarRadius.$full;
  void updateRadiusSelectedOption(dynamic newOption) {
    setState(() {
      selectedRadiusOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
        GSAvatar(
            radius: GSAvatarRadius.\$full,
            size: GSAvatarSizes.\$md,
            style: GSStyle(
              bg: Colors.orange,
              textStyle: const TextStyle(color: Colors.white),
            ),
            fallBackText: const GSAvatarFallBackText('Geeky Stack'),
         )
''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatar"),
      ),
      body: BaseLayout(
        code: code,
        component: GSAvatar(
          radius: selectedRadiusOption,
          size: selectedSizeOption,
          style: GSStyle(
            bg: Colors.orange,
            textStyle: const TextStyle(color: Colors.white),
          ),
          fallBackText: const GSAvatarFallBackText('Geeky Stack'),
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
