import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class CustomDropDown extends StatefulWidget {
  final String title;
  final List<dynamic> dropdownOptions;
  final dynamic selectedOption;
  final Function(dynamic) onChanged;
  const CustomDropDown(
      {super.key,
      required this.dropdownOptions,
      required this.selectedOption,
      required this.title,
      required this.onChanged});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late dynamic selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: $GSColors.backgroundDark500),
        ),
        DropdownButton<dynamic>(
          value: selectedOption,
          onChanged: (dynamic newValue) {
            if (newValue != null) {
              setState(() {
                selectedOption = newValue;
              });
              widget.onChanged(newValue);
            }
          },
          items: widget.dropdownOptions
              .map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(
                enumValueFromString(value.toString()),
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
            );
          }).toList(),
          dropdownColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
        ),
      ],
    );
  }

  enumValueFromString(String value) {
    return value.split('.').last;
  }
}
