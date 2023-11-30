import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/widgets/gs_focusableActionDetector/gs_focusable_action_detector_provider.dart';

class GSFocusableActionDetector extends StatefulWidget {
  final Widget child;
  final MouseCursor? mouseCursor;
  final bool isHovered;
  final bool isFocused;
  final bool isActive;
  const GSFocusableActionDetector({
    super.key,
    required this.child,
    this.mouseCursor,
    this.isHovered = false,
    this.isFocused = false,
    this.isActive=false,
  });

  @override
  State<GSFocusableActionDetector> createState() =>
      _GSFocusableActionDetectorState();
}

class _GSFocusableActionDetectorState extends State<GSFocusableActionDetector> {
  late bool isHovered;
  late bool isFocused;
  late bool isActive;
  @override
  void initState() {
    isHovered = widget.isHovered;
    isFocused = widget.isFocused;
    isActive = widget.isActive;
    super.initState();
  }

  _handleTapDown() {
    if (!isActive) {
      setState(() {
        isActive = true;
      });
    }
  }

  _handleTapUp() {
    if (isActive) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            isActive = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        _handleTapDown();
      },
      onTapUp: (details) {
        _handleTapUp();
      },
      onTapCancel: () {
        _handleTapUp();
      },
      child: FocusableActionDetector(
          mouseCursor: widget.mouseCursor ?? SystemMouseCursors.click,
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
          child: GSFocusableActionDetectorProvider(
              focusStatus: isFocused,
              hoverStatus: isHovered,
              activeStatus: isActive,
              child: widget.child)),
    );
  }
}
