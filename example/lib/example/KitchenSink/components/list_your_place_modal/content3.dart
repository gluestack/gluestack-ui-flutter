import 'package:flutter/material.dart' hide Center;
import 'package:fluttertoast/fluttertoast.dart' hide Toast;
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
    return VStack(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      space: GSSpaces.$md,
      children: [
        const GSText(text: "Title", bold: true, size: GSSizes.$sm),
        const GSInput(
          hintText: "Enter property name",
        ),
        const GSText(text: "Description", bold: true, size: GSSizes.$sm),
        SizedBox(
          width: double.infinity,
          child: TextArea(
            size: GSSizes.$xl,
            hintText: "Provide description",
            style: GSStyle(
              width: 300,
            ),
          ),
        ),
        const GSText(text: "Contact me", bold: true, size: GSSizes.$sm),
        const GSInput(
          hintText: "Phone number",
        ),
        SizedBox(
          width: double.infinity,
          child: Button(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.negative,
            child: const ButtonText(text: 'Post Now'),
            onPressed: () {
              Navigator.of(context).pop();
              _showToast(
                  context: context, title: 'Your property has been listed');
            },
          ),
        ),
        shouldShowSpinner
            ? const Center(child: GSSpinner())
            : SizedBox(
                width: double.infinity,
                child: Button(
                  style: GSStyle(borderRadius: $GSRadii.$md),
                  action: GSActions.secondary,
                  variant: GSVariants.outline,
                  child: const ButtonText(text: 'Save for Later'),
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
      child: Toast(
        variant: GSVariants.solid,
        action: GSActions.success,
        child: GSHStack(
          space: GSSpaces.$xs,
          mainAxisSize: MainAxisSize.min,
          children: [
            const GSIcon(icon: Icons.check_circle_outline_outlined),
            GSHStack(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showCongratulations)
                  ToastTitle(
                    style: GSStyle(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w700)),
                    title: "Congratulations!",
                  ),
                ToastTitle(
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
