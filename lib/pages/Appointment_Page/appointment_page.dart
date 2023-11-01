import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adoptive_calendar/adoptive_calendar.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_dropdown_menu.dart';

final List<String> facilityItems = [
  'Facility 1',
  'Facility 2',
  'Facility 3',
];
final List<String> specialtyItems = [
  'Specialty 1',
  'Specialty 2',
  'Specialty 3'
];
final List<String> doctorItems = [
  'Doctor 1',
  'Doctor 2',
  'Doctor 3',
];

String? selectedFacility;
String? selectedSpecialty;
String? selectedDoctor;
DateTime selectedDate = DateTime.now();

final _formKey = GlobalKey<FormState>();

class DatePickerWidget extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  DatePickerWidget({required this.onDateSelected});

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

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  void onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'APPOINTMENTS',
          style: GoogleFonts.poppins(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            icon: Image.asset('assets/logo/medcare.png',
                width: 36.0, height: 36.0),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GFButton(
                      onPressed: () {},
                      text: "CREATE APPOINTMENTS",
                      type: GFButtonType.outline,
                    ),
                    GFButton(
                      onPressed: () {},
                      text: "BOOKED APPOINTMENTS",
                      type: GFButtonType.outline,
                    ),
                  ],
                ),
              ),
              CustomCard(),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomDropdownMenu(
                      hint: 'Select Your Facility',
                      items: facilityItems,
                      onChanged: (value) => selectedFacility = value,
                    ),
                    const SizedBox(height: 30),
                    CustomDropdownMenu(
                      hint: 'Select Your Specialty',
                      items: specialtyItems,
                      onChanged: (value) => selectedSpecialty = value,
                    ),
                    const SizedBox(height: 30),
                    CustomDropdownMenu(
                      hint: 'Select Your Doctor',
                      items: doctorItems,
                      onChanged: (value) => selectedDoctor = value,
                    ),
                    const SizedBox(height: 30),
                    DatePickerWidget(onDateSelected: onDateSelected),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print('Form is valid');
                        } else {
                          print('Form is not valid');
                        }
                      },
                      child: Text('CREATE APPOINTMENTS'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
