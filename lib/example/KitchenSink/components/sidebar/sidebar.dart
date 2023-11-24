import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar/sortby_checkbox.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSSideBar extends StatelessWidget {
  const KSSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KSSortBy(),
      ],
    );
  }
}
