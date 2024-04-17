import 'package:gluestack_ui/src/style/gs_style.dart';

class GSAncestorProvider extends InheritedWidget {
  final Map<String, GSConfigStyle?>? decedentStyles;
  const GSAncestorProvider(
      {super.key, required this.decedentStyles, required super.child});
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static GSAncestorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSAncestorProvider>();
  }
}
