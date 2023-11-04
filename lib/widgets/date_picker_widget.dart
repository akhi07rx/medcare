import 'package:flutter/material.dart';
import 'package:adoptive_calendar/adoptive_calendar.dart';

class DatePickerWidget extends StatelessWidget {
  final Function(DateTime) onDateSelected;
  final DateTime selectedDate;

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
      title: Text("${selectedDate.toLocal()}".split(' ')[0]),
      trailing: Icon(Icons.calendar_today, color: Colors.grey[700]),
      onTap: () => _selectDate(context),
    );
  }
}
