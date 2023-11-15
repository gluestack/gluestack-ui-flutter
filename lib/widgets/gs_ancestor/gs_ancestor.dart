import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';

class GSAncestor extends StatelessWidget {
  final Widget child;
  final Map<String, GSStyle?>? decedentStyles;
  const GSAncestor({super.key, required this.child,required this.decedentStyles});

  @override
  Widget build(BuildContext context) {
    return GSAncestorProvider(decedentStyles: decedentStyles,child: child,);
  }
}
