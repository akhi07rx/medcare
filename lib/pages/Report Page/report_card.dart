import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Card(
            color: const Color(0xFFE4E7EC),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'NYPD21C2307',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '10 minutes',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Image.network(
                      'https://i.imgur.com/HXuxNoI.png',
                      width: 116,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'BLOOD TEST RESULTS',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Blood, Plasma, and Serum; Acetoacetate follows. 3 mg/L plasma; 3 mg/L acetylcholinesterase (AChE), red blood cells.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'EMR',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.download,
                              size: 24,
                            ),
                            onPressed: () {
                              // Handle download action
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
