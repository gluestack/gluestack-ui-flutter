import 'package:gluestack_ui/gluestack_ui.dart';

class GSModalProvider extends InheritedWidget {
  final VoidCallback removeModal;

  const GSModalProvider({
    required this.removeModal,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSModalProvider oldWidget) {
    return removeModal != oldWidget.removeModal;
  }

  static GSModalProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSModalProvider>();
  }
}