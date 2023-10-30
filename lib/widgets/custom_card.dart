import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE4E7EC),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image.network(
              'https://i.imgur.com/HXuxNoI.png',
              width: 116,
              height: 140,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Connect with doctors & get suggestions',
                    style: GoogleFonts.openSans(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Connect now and get expert insights',
                    style: GoogleFonts.openSans(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Put your code here
                    },
                    child: Text('view details'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
