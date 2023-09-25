import 'package:flutter/material.dart';

class GSContainer extends StatelessWidget {
  final Widget child;

  const GSContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
