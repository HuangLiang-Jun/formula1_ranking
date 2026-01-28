import 'package:flutter/material.dart';

class F1DropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final T? selected;
  final String Function(T) labelBuilder;
  final ValueChanged<T> onChanged;

  const F1DropdownButton({
    super.key,
    required this.items,
    required this.selected,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  State<F1DropdownButton> createState() {
    return _F1DropdownButtonState<T>();
  }
}

class _F1DropdownButtonState<T> extends State<F1DropdownButton> {
  T? _currentValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: _currentValue,
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(widget.labelBuilder(item))
        );
      }).toList(),
      onChanged: (T? newValue) {
        if (newValue != null && newValue != _currentValue) {
          setState(() {
            _currentValue = newValue;
          });
          widget.onChanged(newValue);
        }
      }
    );
  }
}