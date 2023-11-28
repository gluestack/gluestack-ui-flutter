import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/refactor/style2/style_resolver3.dart';
import 'package:gluestack_flutter_pro/refactor/widgets/button/gs_button2_style.dart';

class GSButton2 extends StatelessWidget {
  const GSButton2({super.key});

  @override
  Widget build(BuildContext context) {
    final styler = resolveStyles3(context: context, styles: [buttonStyle2]);
    print(styler.backgroundColor);
    return ElevatedButton(onPressed: () {}, child: Text("GS Button 2"));
  }
}
