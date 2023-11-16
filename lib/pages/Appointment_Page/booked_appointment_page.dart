import 'package:flutter/material.dart';

class BookedAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<AppointmentData>>(
        future: fetchBookedAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No booked appointments available.');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final appointment = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(appointment.doctorAvatar),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. ${appointment.doctorName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          appointment.doctorSpecialty,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showRescheduleDialog(context, appointment);
                              },
                              child: Text('Reschedule'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showCancelDialog(context, appointment);
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<AppointmentData>> fetchBookedAppointments() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      AppointmentData(
        doctorName: 'John Doe',
        doctorSpecialty: 'Cardiologist',
        doctorAvatar: 'https://i.imgur.com/ja6PGNp.jpg',
      ),
      AppointmentData(
        doctorName: 'Jane Smith',
        doctorSpecialty: 'Dermatologist',
        doctorAvatar: 'https://i.imgur.com/AdMBElO.jpg',
      ),
    ];
  }

  void showRescheduleDialog(BuildContext context, AppointmentData appointment) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Reschedule Appointment'),
          content: Text(
              'Do you want to reschedule your appointment with Dr. ${appointment.doctorName}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Appointment rescheduled successfully')),
                );
              },
              child: Text('Reschedule'),
            ),
          ],
        );
      },
    );
  }

  void showCancelDialog(BuildContext context, AppointmentData appointment) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cancel Appointment'),
          content: Text(
              'Do you want to cancel your appointment with Dr. ${appointment.doctorName}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Appointment canceled successfully')),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

class AppointmentData {
  final String doctorName;
  final String doctorSpecialty;
  final String doctorAvatar;

  AppointmentData({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorAvatar,
  });
}
