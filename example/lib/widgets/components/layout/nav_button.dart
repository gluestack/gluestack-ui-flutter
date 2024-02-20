import 'package:flutter/material.dart';
// import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:go_router/go_router.dart';

///
/// Nav button.
/// Uses context.go(routePath) to navigate to destination.
///
class NavButton extends StatelessWidget {
  const NavButton({
    required this.title,
    required this.routePath,
    super.key,
  });

  final String title;
  final String routePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(routePath);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );

    // return GSButton(
    //   style: GSStyle(
    //     padding: const EdgeInsets.symmetric(horizontal: 10),
    //   ),
    //   variant: GSVariants.link,
    //   size: GSSizes.$lg,
    //   onPressed: () {
    //     context.go(routePath);
    //   },
    //   child: GSButtonText(
    //     text: title,
    //     style: GSStyle(dark: GSStyle(color: Colors.blue)),
    //   ),
    // );
  }
}
