import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/utils/base_layout.dart';
import 'package:gluestack_flutter_pro/utils/drop_down.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_fallBack_text.dart';
import 'package:provider/provider.dart';

class AvatarExample extends StatefulWidget {
  const AvatarExample({super.key});

  @override
  State<AvatarExample> createState() => _AvatarExampleState();
}

class _AvatarExampleState extends State<AvatarExample> {
  final List dropdownSizeOptions = [
    GSSizes.$xs,
    GSSizes.$sm,
    GSSizes.$md,
    GSSizes.$lg,
    GSSizes.$xl,
    GSSizes.$2xl,
  ];
  GSSizes selectedSizeOption = GSSizes.$md;
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  final List dropdownRadiusOptions = [
    GSBorderRadius.$none,
    GSBorderRadius.$xs,
    GSBorderRadius.$sm,
    GSBorderRadius.$md,
    GSBorderRadius.$lg,
    GSBorderRadius.$xl,
    GSBorderRadius.$2xl,
    GSBorderRadius.$3xl,
    GSBorderRadius.$full,
  ];
  GSBorderRadius selectedRadiusOption = GSBorderRadius.$full;
  void updateRadiusSelectedOption(dynamic newOption) {
    setState(() {
      selectedRadiusOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: BaseLayout(
          component: GSAvatar(
            radius: selectedRadiusOption,
            size: selectedSizeOption,
            style: GSStyle(
              bg: Colors.orange,
              textStyle: const TextStyle(color: Colors.white),
            ),
            fallBackText: const GSAvatarFallBackText(
              'Geeky Stack',
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
              CustomDropDown(
                title: "borderRadius",
                dropdownOptions: dropdownRadiusOptions,
                selectedOption: selectedRadiusOption,
                onChanged: updateRadiusSelectedOption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
