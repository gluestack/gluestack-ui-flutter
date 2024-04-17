import 'package:gluestack_ui/src/style/gs_style.dart';

class GSAncestor extends StatelessWidget {
  final Widget child;
  final Map<String, GSConfigStyle?>? decedentStyles;
  const GSAncestor(
      {super.key, required this.child, required this.decedentStyles});

  @override
  Widget build(BuildContext context) {
    return GSAncestorProvider(
      decedentStyles: decedentStyles,
      child: child,
    );
  }
}
