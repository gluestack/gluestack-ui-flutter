import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/styled_button/styled_button_variants.dart';

ElevatedButton StyledButton({
  required void Function()? onPressed,
  required Widget child,
  String? variant = 'solid',
  String? action = 'primary',
  String? size = 'md',
}) {
  final buttonAction =
      buttonVariants.variants['action']![action] != null ? action : 'primary';

  final buttonVariant =
      buttonVariants.variants['action']![buttonAction]![variant] != null
          ? variant
          : 'solid';

  final buttonStyle =
      buttonVariants.variants['action']![buttonAction]![buttonVariant];

  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: buttonVariants.variants['size']?[size]['padding'],
      backgroundColor: buttonStyle?['backgroundColor'],
      shape: RoundedRectangleBorder(
        borderRadius: buttonVariants.variants['size']?[size]['borderRadius'],
        side: BorderSide(
          color: buttonStyle?['borderColor'],
          width: 1.0,
        ),
      ),
    ),
    child: child,
  );
}
