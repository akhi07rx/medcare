import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'pages/Appointment_Page/appointment_page.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  final pages = [
    // MainPage(),
    AppointmentPage(),
    AppointmentPage(),
    AppointmentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Iconsax.home),
              title: Text(""),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: Icon(Iconsax.save_2),
              title: Text(""),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(Iconsax.activity),
              title: Text(""),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: Icon(Iconsax.user),
              title: Text(""),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         child: Text('Go to Appointment Page'),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AppointmentPage()),
//           );
//         },
//       ),
//     );
//   }
// }
