import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/styled_button/styled_button_variants.dart';

class GSButton extends StatelessWidget {
  final String action;
  final String variant;
  final String size;
  final Widget child;
  final VoidCallback onPressed;

  const GSButton({
    required this.action,
    required this.variant,
    required this.child,
    required this.onPressed,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final buttonAction =
        buttonVariants.variants['action']![action] != null ? action : 'primary';

    final buttonVariant =
        buttonVariants.variants['action']![buttonAction]![variant] != null
            ? variant
            : 'solid';

    final buttonStyle =
        buttonVariants.variants['action']![buttonAction]![buttonVariant];

    return GSButtonProvider(
        action: action,
        variant: variant,
        size: size,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: buttonVariants.variants['size']?[size]['padding'],
            backgroundColor: buttonStyle?['backgroundColor'],
            shape: RoundedRectangleBorder(
              borderRadius: buttonVariants.variants['size']?[size]
                  ['borderRadius'],
              side: BorderSide(
                color: buttonStyle?['borderColor'],
                width: 1.0,
              ),
            ),
          ),
          child: child,
        ));
  }
}
