import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookedAppointmentsPage extends StatefulWidget {
  const BookedAppointmentsPage({Key? key}) : super(key: key);

  @override
  _BookedAppointmentsPageState createState() => _BookedAppointmentsPageState();
}

class _BookedAppointmentsPageState extends State<BookedAppointmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booked Appointments',
          style: GoogleFonts.poppins(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Booked Appointments List'),
          ),
        ),
      ),
    );
  }
}
