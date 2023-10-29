import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  CustomDropdownMenu(
      {required this.hint, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      hint: Text(
        hint,
        style: const TextStyle(fontSize: 14),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 14),
              )))
          .toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option.';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
