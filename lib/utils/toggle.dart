import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_switch/gs_switch.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(color: $GSColors.backgroundDark500),
        ),
        GSSwitch(
            value: widget.value,
            onToggle: (value) {
              setState(() {
                selectedValue = value;
              });
              widget.onToggle(value);
            }),
      ],
    );
  }
}
