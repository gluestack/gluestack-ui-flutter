import 'package:flutter/widgets.dart';

class GSShowAlertDialog {
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor,
  }) async {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: barrierDismissible
                  ? () {
                      Navigator.of(context).pop();
                    }
                  : null,
              child: Container(
                color: barrierColor ?? const Color(0xFF000000),
              ),
            ),
          ),
          builder(context),
        ],
      ),
    );

    overlay.insert(overlayEntry);

    try {
      return await Navigator.of(context).push<T>(
        PageRouteBuilder<T>(
          opaque: false,
          pageBuilder: (_, __, ___) => Container(),
        ),
      );
    } finally {
      overlayEntry.remove();
    }
  }
}
