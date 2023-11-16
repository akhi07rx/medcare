import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_appointment_page.dart';
import 'booked_appointment_page.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'MEDCARE',
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
          bottom: TabBar(
            tabs: [
              Tab(text: "CREATE APPOINTMENTS"),
              Tab(text: "BOOKED APPOINTMENTS"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CreateAppointmentPage(),
            BookedAppointmentPage(),
          ],
        ),
      ),
    );
  }
}
