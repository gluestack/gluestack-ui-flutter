import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/poc/temp_token.dart';

class GSTempButton extends StatelessWidget {
  final Widget child;
  final GSRadiis? radii;
  const GSTempButton({super.key, required this.child, this.radii});

  @override
  Widget build(BuildContext context) {
    final String text = GluestackStateN.of(context)!.test;
    log('Text: $text');
    log('Radii: $radii');
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 90,
      width: 300,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
