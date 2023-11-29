import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_style_builder/gs_style_builder_provider.dart';

class GSStyleBuilder extends StatefulWidget {
  final Widget child;
  final bool shouldIgnorePointer;
  final bool isHovered;
  final bool isActive;
  final bool isFocused;
  final bool isDisabled;
  final bool isInvaild;

  final MouseCursor? mouseCursor;
  const GSStyleBuilder({
    super.key,
    required this.child,
    this.mouseCursor,
    this.isActive = false,
    this.isDisabled = false,
    this.isFocused = false,
    this.isHovered = false,
    this.isInvaild = false,
    this.shouldIgnorePointer = false,
  });

  @override
  State<GSStyleBuilder> createState() => _GSStyleBuilderState();
}

class _GSStyleBuilderState extends State<GSStyleBuilder> {
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
    if (!isActive && !(widget.shouldIgnorePointer)) {
      setState(() {
        isActive = true;
      });
    }
  }

  _handleTapUp() {
    if (isActive && !(widget.shouldIgnorePointer)) {
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
  void didUpdateWidget(covariant GSStyleBuilder oldWidget) {
    if (oldWidget.isFocused != widget.isFocused) {
      setState(() {
        isFocused = widget.isFocused;
      });
    }

    if (oldWidget.isActive != widget.isActive) {
      setState(() {
        isActive = widget.isActive;
      });
    }

    if (oldWidget.isHovered != widget.isHovered) {
      setState(() {
        isHovered = widget.isHovered;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.shouldIgnorePointer,
      child: GestureDetector(
        onTapDown: (_) {
          _handleTapDown();
        },
        onTapUp: (_) {
          _handleTapUp();
        },
        onTapCancel: () {
          _handleTapUp();
        },
        child: FocusableActionDetector(
            mouseCursor: widget.mouseCursor != null
                ? widget.mouseCursor!
                : widget.isDisabled
                    ? SystemMouseCursors.forbidden
                    : SystemMouseCursors.click,
            onFocusChange: (value) {
              if (isFocused != value && !(widget.shouldIgnorePointer)) {
                setState(() {
                  isFocused = value;
                });
              }
            },
            onShowHoverHighlight: (value) {
              if (isHovered != value && !(widget.shouldIgnorePointer)) {
                setState(() {
                  isHovered = value;
                });
              }
            },
            //check if pointer error is comming ,if yes add ignorePointer to below line with inverse condition of above ignorePointer
            child: GSStyleBuilderProvider(
                isActive: isActive,
                isFocused: isFocused,
                isHovered: isHovered,
                isDisabled: widget.isDisabled,
                isInvaild: widget.isInvaild,
                child: widget.child)),
      ),
    );
  }
}
