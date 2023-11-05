import 'package:flutter/material.dart';
import 'components/bottom_nav_bar.dart';
import 'pages/Appointment_Page/appointment_page.dart';

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
    MainPage(),
    AppointmentPage(),
    AppointmentPage(),
    AppointmentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Go to Appointment Page'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppointmentPage()),
          );
        },
      ),
    );
  }
}
