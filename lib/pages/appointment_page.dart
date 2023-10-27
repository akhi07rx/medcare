import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

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
        leading: BackButton(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
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
                  text: "MY APPOINTMENTS",
                  // icon: Icon(Icons.note_alt_outlined),
                  type: GFButtonType.outline,
                  // disabledColor: Colors.blue,
                ),
                GFButton(
                  onPressed: () {},
                  text: "BOOKED APPOINTMENTS",
                  //  icon: Icon(Icons.note_alt_outlined),
                  type: GFButtonType.outline,
                ),
              ],
            ),
          ),
          Card(
            color: Color(0xFFE4E7EC),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  'https://i.imgur.com/HXuxNoI.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Connect with doctors & get suggestions',
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Connect now and get expert insights',
                      style: GoogleFonts.openSans(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
