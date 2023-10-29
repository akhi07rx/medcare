import 'package:flutter/material.dart';

class DropdownMenuX extends StatefulWidget {
  final List<String> list;
  const DropdownMenuX({required this.list, super.key});

  @override
  State<DropdownMenuX> createState() => _DropdownMenuXState();
}

class _DropdownMenuXState extends State<DropdownMenuX> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(fontSize: 16)),
          );
        }).toList(),
      ),
    );
  }
}
