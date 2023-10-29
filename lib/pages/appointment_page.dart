import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_card.dart';

final List<String> facilityItems = ['Facility 1', 'Facility 2', 'Facility 3'];
final List<String> specialtyItems = [
  'Specialty 1',
  'Specialty 2',
  'Specialty 3'
];
final List<String> doctorItems = ['Doctor 1', 'Doctor 2', 'Doctor 3'];
final List<String> dateItems = ['01/01/2023', '02/01/2023', '03/01/2023'];

String? selectedFacility;
String? selectedSpecialty;
String? selectedDoctor;
String? selectedDate;

final _formKey = GlobalKey<FormState>();

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);

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
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
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
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownMenu(
                  hint: 'Select Your Facility',
                  items: facilityItems,
                  onChanged: (value) => selectedFacility = value,
                ),
                const SizedBox(height: 20),
                DropdownMenu(
                  hint: 'Select Your Specialty',
                  items: specialtyItems,
                  onChanged: (value) => selectedSpecialty = value,
                ),
                const SizedBox(height: 20),
                DropdownMenu(
                  hint: 'Select Your Doctor',
                  items: doctorItems,
                  onChanged: (value) => selectedDoctor = value,
                ),
                const SizedBox(height: 20),
                DropdownMenu(
                  hint: 'Select Date (DD/MM/YYYY)',
                  items: dateItems,
                  onChanged: (value) => selectedDate = value,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('Form is valid');
                    } else {
                      print('Form is not valid');
                    }
                  },
                  child: const Text('Submit Button'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownMenu extends StatelessWidget {
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  DropdownMenu(
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
