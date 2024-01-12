import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  BuildContext context, {
  Widget? child,
  ToastGravity? gravity,
  Duration? toastDuration = const Duration(seconds: 3),
}) {
  Widget toast = child ??
      Container(
        width: 20,
        height: 20,
        color: const Color(0xFFFF0000), //red
      );

  FToast().init(context).showToast(
        child: toast,
        gravity: gravity,
        toastDuration: toastDuration!,
      );
}
