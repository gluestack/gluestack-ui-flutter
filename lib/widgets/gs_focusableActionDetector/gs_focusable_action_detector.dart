import 'package:flutter/material.dart';

class GSFocusableActionDetector extends StatefulWidget {
  final Widget child;
  const GSFocusableActionDetector({super.key, required this.child});

  @override
  State<GSFocusableActionDetector> createState() =>
      _GSFocusableActionDetectorState();
}

class _GSFocusableActionDetectorState extends State<GSFocusableActionDetector> {
  late bool isHovered;
  late bool isFocused;
  @override
  void initState() {
    isHovered = false;
    isFocused = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
        onFocusChange: (value) {
          if (isFocused != value) {
            setState(() {
              isFocused = value;
            });
          }
        },
        onShowHoverHighlight: (value) {
          if (isHovered != value) {
            setState(() {
              isHovered = value;
            });
          }
        },
        child: widget.child);
  }
}
