import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style_external_inline.dart';
import 'package:gluestack_ui/src/theme/config/enums.dart';

class GSSelect extends StatefulWidget {
  final List<String> options;
  final GSSelectSizes? size;
  final GSSelectVariants? variant;
  final GSStyle? style;

  const GSSelect(
      {super.key, this.size, this.variant, required this.options, this.style});

  @override
  State<GSSelect> createState() => _GSSelectState();
}

class _GSSelectState extends State<GSSelect> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        width: null,
        decoration: BoxDecoration(
          border: widget.variant == GSSelectVariants.underlined
              ? Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2.0,
                  ),
                )
              : Border.all(
                  color: Colors.grey.shade300,
                ),
          borderRadius: widget.variant == GSSelectVariants.rounded
              ? BorderRadius.circular(30.0)
              : widget.variant == GSSelectVariants.outline
                  ? BorderRadius.circular(4.0)
                  : BorderRadius.zero,
        ),
        child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          hint: const Text('Select option'),
          value: selectedOption,
          isExpanded: true,
          iconSize: 24,
          // elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue;
            });
          },
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
