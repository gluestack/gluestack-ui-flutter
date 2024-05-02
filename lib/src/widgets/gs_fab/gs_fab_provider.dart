import 'package:gluestack_ui/gluestack_ui.dart';

class GSFabProvider extends InheritedWidget {
  final Map<String, GSConfigStyle?>? descendantStyles;

  const GSFabProvider({
    super.key,
    required this.descendantStyles,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static GSFabProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSFabProvider>();
  }
}
