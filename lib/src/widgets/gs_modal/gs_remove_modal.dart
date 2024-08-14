import 'package:gluestack_ui/gluestack_ui.dart';

removeOverlayEntry(OverlayEntry? overlayEntry) {
  if (overlayEntry != null) {
    overlayEntry.remove();
  }
}
