import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/pages/Report%20Page/report_card.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Column(
        children: [
          ReportCard(),
          // Add other widgets as needed
        ],
      ),
    );
  }
}
