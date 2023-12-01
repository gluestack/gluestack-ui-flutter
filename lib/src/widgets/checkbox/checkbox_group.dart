import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/widgets/checkbox/checkbox_group_provider.dart';

class CheckBoxGroup extends StatefulWidget {
  final List<String> values;
  final Widget child;
  final bool isDisabled;
  final bool isInvalid;
  final bool isReadOnly;
  final void Function(List<String>? values)? onChanged;

  const CheckBoxGroup(
      {super.key,
      required this.child,
      this.onChanged,
      this.values = const [],
      this.isDisabled = false,
      this.isInvalid = false,
      this.isReadOnly = false});

  @override
  State<CheckBoxGroup> createState() => _GSCheckBoxGroupState();
}

class _GSCheckBoxGroupState extends State<CheckBoxGroup> {
  late List<String> _values;
  @override
  void initState() {
    _values = [...widget.values];
    super.initState();
  }

  void _updateValue(String value, {bool shouldUpdate = true}) {
    if (_values.contains(value)) {
      _values.remove(value);
    } else {
      _values.add(value);
    }
    if (shouldUpdate) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckBoxGroupProvider(
        values: _values,
        onChanged: widget.onChanged,
        isDisabled: widget.isDisabled,
        isInvalid: widget.isInvalid,
        isReadOnly: widget.isReadOnly,
        updateValues: _updateValue,
        child: widget.child);
  }
}
