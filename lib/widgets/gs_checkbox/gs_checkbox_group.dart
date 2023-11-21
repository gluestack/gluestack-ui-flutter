import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_group_provider.dart';

class GSCheckBoxGroup extends StatefulWidget {
  final List<String> values;
  final Widget child;
  final void Function(List<String>?)? onChanged;
  const GSCheckBoxGroup(
      {super.key, required this.child, this.onChanged, this.values = const []});

  @override
  State<GSCheckBoxGroup> createState() => _GSCheckBoxGroupState();
}

class _GSCheckBoxGroupState extends State<GSCheckBoxGroup> {
  late List<String> _values;
  @override
  void initState() {
    _values = [...widget.values];
    super.initState();
  }

  void _updateValue(String value) {
    if (_values.contains(value)) {
      setState(() {
        _values.remove(value);
      });
    } else {
       setState(() {
          _values.add(value);
       });
    }

  }

  @override
  Widget build(BuildContext context) {
    return GSCheckBoxGroupProvider(
        values: _values,
        onChanged: widget.onChanged,
        updateValues: _updateValue,
        child: widget.child);
  }
}
