import 'package:flutter/material.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/date_picker_widget.dart';
import '../../widgets/sucess-lottie.dart';

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});
}

class Doctor {
  final String name;
  final Category category;
  Doctor({required this.name, required this.category});
}

enum Specialty {
  Psychiatrist,
  Dermatologist,
  Pediatrician,
  OrthopedicSurgeon,
  Ophthalmologist,
  Gynecologist,
  Urologist,
  Neurologist,
  ENTSpecialist,
}

List<Category> categories = [
  Category(id: 1, name: 'Psychiatrist'),
  Category(id: 2, name: 'Dermatologist'),
  Category(id: 3, name: 'Pediatrician'),
  Category(id: 4, name: 'Orthopedic Surgeon'),
  Category(id: 5, name: 'Ophthalmologist'),
  Category(id: 6, name: 'Gynecologist'),
  Category(id: 7, name: 'Urologist'),
  Category(id: 8, name: 'Neurologist'),
  Category(id: 9, name: 'ENT Specialist'),
];

List<Doctor> doctors = [
  Doctor(name: 'John Smith', category: categories[0]),
  Doctor(name: 'Chris Evans', category: categories[1]),
  Doctor(name: 'Ryan Reynolds', category: categories[2]),
  Doctor(name: 'James Brown', category: categories[3]),
  Doctor(name: 'Emily Davis', category: categories[4]),
  Doctor(name: 'Sam Smith', category: categories[4]),
  Doctor(name: 'Michael Wilson', category: categories[5]),
  Doctor(name: 'Maria Garcia', category: categories[6]),
  Doctor(name: 'Robert Martinez', category: categories[7]),
  Doctor(name: 'William Turner', category: categories[8]),
  Doctor(name: 'Thomas Turner', category: categories[8]),
];

DateTime selectedDate = DateTime.now();
Category? selectedSpecialty;
Doctor? selectedDoctor;

final _formKey = GlobalKey<FormState>();

class CreateAppointmentPage extends StatefulWidget {
  const CreateAppointmentPage({Key? key}) : super(key: key);

  @override
  _CreateAppointmentPageState createState() => _CreateAppointmentPageState();
}

class _CreateAppointmentPageState extends State<CreateAppointmentPage> {
  bool isFormValid = false;
  DateTime selectedDate = DateTime.now();
  Category? selectedSpecialty;
  Doctor? selectedDoctor;
  List<Doctor> filteredDoctors = [];

  void onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void onSpecialtyChanged(Category? specialty) {
    setState(() {
      selectedSpecialty = specialty;
      filteredDoctors = doctors
          .where((doctor) => doctor.category.id == specialty?.id)
          .toList();
      selectedDoctor = null;
    });
  }

  void onDoctorChanged(Doctor? doctor) {
    setState(() {
      selectedDoctor = doctor;
    });
  }

  void showConfirmationDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext builderContext) {
        return SuccessLottie();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            CustomCard(),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<Category>(
                    hint: Text('Select Your Specialty'),
                    value: selectedSpecialty,
                    items: categories.map((Category category) {
                      return DropdownMenuItem<Category>(
                        value: category,
                        child: Text(
                          category.name,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: onSpecialtyChanged,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade600),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField<Doctor>(
                    hint: Text('Select Your Doctor'),
                    value: selectedDoctor,
                    items: filteredDoctors.map((Doctor doctor) {
                      return DropdownMenuItem<Doctor>(
                        value: doctor,
                        child: Text(
                          doctor.name,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: onDoctorChanged,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a doctor';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade600),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  DatePickerWidget(
                    onDateSelected: onDateSelected,
                    selectedDate: selectedDate,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          isFormValid = true;
                        });
                        print('Form is valid');
                        showConfirmationDialog();
                      } else {
                        setState(() {
                          isFormValid = false;
                        });
                        print('Form is not valid');
                      }
                    },
                    child: Text('CREATE APPOINTMENTS'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
