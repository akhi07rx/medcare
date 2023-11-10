import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:adoptive_calendar/adoptive_calendar.dart';

class DatePickerWidget extends StatelessWidget {
  final void Function(DateTime) onDateSelected;
  final DateTime? selectedDate;

  DatePickerWidget({required this.onDateSelected, required this.selectedDate});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AdoptiveCalendar(
          initialDate: DateTime.now(),
        );
      },
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(selectedDate != null
          ? "${selectedDate!.toLocal()}".split(' ')[0]
          : "SELECT A DATE"),
      trailing: Icon(Iconsax.calendar_add, color: Colors.grey[700]),
      onTap: () => _selectDate(context),
    );
  }
}
