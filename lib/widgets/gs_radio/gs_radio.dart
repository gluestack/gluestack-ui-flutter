import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_style.dart';

/*

what is achieved so far

   1) invaild state
   2) disable state
   3) hover state (default)
   4) support for inline style


what is pending
    
    1) managing hover state on custom inline style
    2) making radio icon circle hoverable
    3) passing props to children

*/

class GSRadio<T> extends StatefulWidget {
  final GSSizes? size;
  final Widget icon;
  final Widget? label;
  final T value;
  final T groupValue;
  final bool isHovered;
  final bool isDisabled;
  final bool isInvalid;
  final GSStyle? style;
  final void Function(T?)? onChanged;

  const GSRadio(
      {super.key,
      required this.icon,
      required this.groupValue,
      required this.value,
      required this.onChanged,
      this.style,
      this.isHovered = false,
      this.isDisabled = false,
      this.isInvalid = false,
      this.label,
      this.size});

  @override
  State<GSRadio<T>> createState() => _GSRadioState<T>();
}

class _GSRadioState<T> extends State<GSRadio<T>> {
  late bool isHovered;
  @override
  void initState() {
    isHovered = widget.isHovered;
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    final radioSize = widget.size ?? radioStyle.props!.size!;
  
    return FocusableActionDetector(
      mouseCursor: widget.isDisabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onShowHoverHighlight: (value) {
        if (value != isHovered) {
          setState(() {
            isHovered = value;
          });
        }
      },
      child: GSRadioProvider<T>(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
          isHovered: isHovered,
          size: radioSize,
          style: widget.style,
          isInvalid: widget.isInvalid,
          isDisabled: widget.isDisabled,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [widget.icon, if (widget.label != null) widget.label!],
          )),
    );
  }
}
