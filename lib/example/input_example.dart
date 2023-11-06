import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input.dart';

class InputExample extends StatelessWidget {
  const InputExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSInput(
              size: GSSizes.xl,
              variant: GSVariants.outline,
              hintText: "Enter text here",
              style: GSStyle(
                width: 300,
                borderColor: $GSColors.pink500,
                onFocus: GSStyle(
                  borderColor: $GSColors.purple800,
                  borderWidth: $GSBorderWidth.$2,
                  borderBottomWidth: $GSBorderWidth.$2,
                ),
                onHover: GSStyle(
                  borderColor: $GSColors.green600,
                  borderWidth: $GSBorderWidth.$4,
                  borderBottomWidth: $GSBorderWidth.$4,
                ),
                xs: GSStyle(
                  borderColor: $GSColors.purple400,
                ),
                dark: GSStyle(
                  borderColor: $GSColors.warmGray900,
                  borderWidth: $GSBorderWidth.$8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
