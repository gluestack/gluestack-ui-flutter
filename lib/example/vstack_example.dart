import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_box/gs_box.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class VStackExample extends StatelessWidget {
  const VStackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: GSVStack(
        mainAxisAlignment: MainAxisAlignment.center,
        isReversed: true,
        space: GSSpaces.$2xl,
        children: [
          GSBox(
            style: GSStyle(height: 200, width: 200, color: $GSColors.amber900),
            child: const Text('1'),
          ),
          GSBox(
            style: GSStyle(height: 200, width: 200, color: $GSColors.red900),
            child: const Text('2'),
          ),
          GSBox(
            style: GSStyle(height: 200, width: 200, color: $GSColors.green900),
            child: const Text('3'),
          ),
        ],
      )),
    );
  }
}
