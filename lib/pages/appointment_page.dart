import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_card.dart';
import './Appointment Page/dropdown_menu.dart';

const List<String> facilityList = <String>['Facility 1'];
const List<String> specialtyList = <String>['Specialty 1'];
const List<String> doctorList = <String>['Doctor 1'];
const List<String> dateList = <String>['01/01/2023'];

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
          const DropdownMenu(list: facilityList),
          const SizedBox(height: 20),
          const DropdownMenu(list: specialtyList),
          const SizedBox(height: 20),
          const DropdownMenu(list: doctorList),
          const SizedBox(height: 20),
          const DropdownMenu(list: dateList),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
