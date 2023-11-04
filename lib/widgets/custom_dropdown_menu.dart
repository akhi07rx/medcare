import 'package:flutter/material.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  final String hint;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemBuilder;

  CustomDropdownMenu({
    required this.hint,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            vertical: 16, horizontal: 10), // Added horizontal padding
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      hint: Text(
        hint,
        style: const TextStyle(fontSize: 14),
      ),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            itemBuilder(item),
            style: const TextStyle(fontSize: 14),
          ),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select an option.';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
