import 'package:gluestack_ui/gluestack_ui.dart';

class GSModalProvider extends InheritedWidget {
  final VoidCallback removeModal;

  const GSModalProvider({
   super.key, 
    required this.removeModal,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant GSModalProvider oldWidget) {
    return removeModal != oldWidget.removeModal;
  }

  static GSModalProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSModalProvider>();
  }
}