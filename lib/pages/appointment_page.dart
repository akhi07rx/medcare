import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_dropdown_menu.dart';

final List<String> facilityItems = ['Facility 1', 'Facility 2', 'Facility 3'];
final List<String> specialtyItems = [
  'Specialty 1',
  'Specialty 2',
  'Specialty 3'
];
final List<String> doctorItems = ['Doctor 1', 'Doctor 2', 'Doctor 3'];
final List<String> dateItems = ['01/01/1523', '02/01/1523', '03/01/1523'];

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
          const SizedBox(height: 15),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomDropdownMenu(
                  hint: 'Select Your Facility',
                  items: facilityItems,
                  onChanged: (value) => selectedFacility = value,
                ),
                const SizedBox(height: 15),
                CustomDropdownMenu(
                  hint: 'Select Your Specialty',
                  items: specialtyItems,
                  onChanged: (value) => selectedSpecialty = value,
                ),
                const SizedBox(height: 15),
                CustomDropdownMenu(
                  hint: 'Select Your Doctor',
                  items: doctorItems,
                  onChanged: (value) => selectedDoctor = value,
                ),
                const SizedBox(height: 15),
                CustomDropdownMenu(
                  hint: 'Select Date (DD/MM/YYYY)',
                  items: dateItems,
                  onChanged: (value) => selectedDate = value,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('Form is valid');
                    } else {
                      print('Form is not valid');
                    }
                  },
                  child: const Text('CREATE APPOINTMENTS'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
