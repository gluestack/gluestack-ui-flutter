import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';

class IconExample extends StatelessWidget {
  const IconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GSIcon(
          icon: Icons.calendar_month,
          size: GSSizes.$xl,
          style: GSStyle(
            color: $GSColors.red500,
          ),
        ),
      ),
    );
  }
}
