import 'package:gluestack_ui/gluestack_ui.dart';

class GSModalProvider extends InheritedWidget {
  final VoidCallback removeModal;

  const GSModalProvider({
    Key? key,
    required this.removeModal,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant GSModalProvider oldWidget) {
    return removeModal != oldWidget.removeModal;
  }

  static GSModalProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSModalProvider>();
  }
}