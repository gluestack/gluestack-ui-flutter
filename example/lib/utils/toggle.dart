import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class CustomToggle extends StatefulWidget {
  final String title;
  final bool value;
  final Function(bool) onToggle;

  const CustomToggle(
      {super.key,
      required this.value,
      required this.onToggle,
      required this.title});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  late bool selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSText(
          text: widget.title,
        ),
        const SizedBox(height: 10),
        GSSwitch(
          value: widget.value,
          onToggle: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.onToggle(value);
          },
        ),
      ],
    );
  }
}
