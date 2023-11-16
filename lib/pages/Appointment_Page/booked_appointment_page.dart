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
                    title: Text(appointment.doctorName),
                    subtitle: Text(appointment.doctorSpecialty),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showRescheduleDialog(context, appointment);
                          },
                          child: Text('Reschedule'),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            showCancelDialog(context, appointment);
                          },
                          child: Text('Cancel'),
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
    // Simulate fetching data from a remote server or database.
    await Future.delayed(Duration(seconds: 2));
    return [
      AppointmentData(
        doctorName: 'Dr. John Doe',
        doctorSpecialty: 'Cardiologist',
        doctorAvatar: 'https://example.com/avatar1.jpg',
      ),
      AppointmentData(
        doctorName: 'Dr. Jane Smith',
        doctorSpecialty: 'Dermatologist',
        doctorAvatar: 'https://example.com/avatar2.jpg',
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
              'Do you want to reschedule your appointment with ${appointment.doctorName}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add logic for rescheduling the appointment.
                // You can navigate to a reschedule page or show a success message.
                Navigator.pop(context); // Close the dialog
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
              'Do you want to cancel your appointment with ${appointment.doctorName}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Add logic for canceling the appointment.
                // You can show a success message or navigate back to the appointments page.
                Navigator.pop(context); // Close the dialog
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
