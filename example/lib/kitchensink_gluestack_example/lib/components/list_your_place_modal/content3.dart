import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class ListYourPlaceModalContent3 extends StatefulWidget {
  const ListYourPlaceModalContent3({super.key});

  @override
  State<ListYourPlaceModalContent3> createState() =>
      _ListYourPlaceModalContent3State();
}

class _ListYourPlaceModalContent3State
    extends State<ListYourPlaceModalContent3> {
  bool shouldShowSpinner = false;
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      space: GSVstackSpaces.$md,
      children: [
        const GSText(text: "Title", bold: true, size: GSSizes.$sm),
        const GSInput(
          hoverColor: Color(0xffE11D48),
          hintText: "Enter property name",
        ),
        const GSText(text: "Description", bold: true, size: GSSizes.$sm),
        GSBox(
          style: GSStyle(width: double.infinity),
          child: GSTextArea(
            hoverColor: const Color(0xffE11D48),
            size: GSTextAreaSizes.$xl,
            hintText: "Provide description",
            style: GSStyle(
              width: 300,
            ),
          ),
        ),
        const GSText(text: "Contact me", bold: true, size: GSSizes.$sm),
        const GSInput(
          hoverColor: Color(0xffE11D48),
          hintText: "Phone number",
        ),
        GSBox(
          style: GSStyle(width: double.infinity),
          child: GSButton(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSButtonActions.negative,
            child: const GSButtonText(text: 'Post Now'),
            onPressed: () {
              Navigator.of(context).pop();
              _showToast(
                  context: context, title: 'Your property has been listed');
            },
          ),
        ),
        shouldShowSpinner
            ? const Center(child: GSSpinner())
            : GSBox(
                style: GSStyle(width: double.infinity),
                child: GSButton(
                  style: GSStyle(borderRadius: $GSRadii.$md),
                  action: GSButtonActions.secondary,
                  variant: GSButtonVariants.outline,
                  child: const GSButtonText(text: 'Save for Later'),
                  onPressed: () {
                    setState(() {
                      shouldShowSpinner = true;
                    });
                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        Navigator.of(context).pop();
                        _showToast(
                            context: context,
                            title:
                                'Your property listing has been successfully saved',
                            showCongratulations: false);
                      },
                    );
                  },
                ),
              )
      ],
    );
  }

  _showToast(
      {required BuildContext context,
      required String title,
      bool showCongratulations = true}) {
    return showToast(
      context,
      gravity: ToastGravity.TOP,
      child: GSToast(
        variant: GSToastVariants.solid,
        action: GSToastActions.success,
        child: GSHStack(
          space: GSHstackSpaces.$xs,
          mainAxisSize: MainAxisSize.min,
          children: [
            const GSIcon(icon: Icons.check_circle_outline_outlined),
            GSHStack(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showCongratulations)
                  GSToastTitle(
                    style: GSStyle(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w700)),
                    title: "Congratulations! ",
                  ),
                GSToastTitle(
                  title: title,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
