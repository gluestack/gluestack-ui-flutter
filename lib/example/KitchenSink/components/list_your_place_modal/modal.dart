import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/list_your_place_modal/content1.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/list_your_place_modal/content2.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/list_your_place_modal/content3.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';

import 'package:provider/provider.dart';

class ListYourPlaceModal extends StatefulWidget {
  const ListYourPlaceModal({super.key});

  @override
  State<ListYourPlaceModal> createState() => _ListYourPlaceModalState();
}

class _ListYourPlaceModalState extends State<ListYourPlaceModal> {
  int _currentModalContent = 0;
  void _moveToNextModalContent() {
    if (_currentModalContent < 3) {
      setState(() {
        _currentModalContent++;
      });
    }
  }

  void _moveBackToPreviousModalContent() {
    if (_currentModalContent != 0) {
      setState(() {
        _currentModalContent--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AlertDialog(
        backgroundColor: themeProvider.getThemeData().canvasColor,
        title: GSHStack(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const GSHeading(size: GSSizes.$sm, text: "List your place"),
            GSPressable(
                onPress: () {
                  Navigator.of(context).pop();
                },
                child: const GSIcon(icon: Icons.close)),
          ],
        ),
        content: _currentModalContent == 0
            ? SizedBox(
                width: 500,
                child: ListYourPlaceModalContent1(
                    nextFunction: _moveToNextModalContent))
            : _currentModalContent == 1
                ? SizedBox(
                  width: 500,
                  child: ListYourPlaceModalContent2(
                      nextFunction: _moveToNextModalContent,
                      backFunction: _moveBackToPreviousModalContent,
                    ),
                )
                :const SizedBox(
                  width: 500,
                  child:  ListYourPlaceModalContent3()));
  }
}
