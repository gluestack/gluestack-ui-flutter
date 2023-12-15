import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:kitchensink_gluestack/components/list_your_place_modal/content1.dart';
import 'package:kitchensink_gluestack/components/list_your_place_modal/content2.dart';
import 'package:kitchensink_gluestack/components/list_your_place_modal/content3.dart';

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
    return AlertDialog(
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
          ? GSBox(
              style: GSStyle(width: 500),
              child: ListYourPlaceModalContent1(
                  nextFunction: _moveToNextModalContent))
          : _currentModalContent == 1
              ? GSBox(
                  style: GSStyle(width: 500),
                  child: ListYourPlaceModalContent2(
                    nextFunction: _moveToNextModalContent,
                    backFunction: _moveBackToPreviousModalContent,
                  ),
                )
              : GSBox(
                  style: GSStyle(width: 500),
                  child: const ListYourPlaceModalContent3(),
                ),
    );
  }
}
