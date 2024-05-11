import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FacultyStatus extends StatelessWidget {
  const FacultyStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Status'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('faculties').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Show error dialog after a delay
            _showErrorDialog(context, 'Error: ${snapshot.error}');
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> facultyData = documents[index].data() as Map<String, dynamic>;

              return FacultyStatusTile(
                facultyName: facultyData['displayName'] ?? 'Unknown',
                isAvailable: facultyData['available'] ?? false,
                phoneNumber: facultyData['phoneNumber'] ?? 'Not available',
                email: facultyData['email'] ?? 'Not available',
                location: facultyData['location'] ?? 'Unknown',
                startTime: _parseTimeOfDay(facultyData['startTime']),
                endTime: _parseTimeOfDay(facultyData['endTime']),
              );
            },
          );
        },
      ),
    );
  }

  TimeOfDay _parseTimeOfDay(String? timeString) {
    if (timeString == null || !timeString.startsWith('TimeOfDay(')) {
      return TimeOfDay(hour: 0, minute: 0); // Default value if parsing fails
    }
    try {
      String trimmed = timeString.replaceAll('TimeOfDay(', '').replaceAll(')', '');
      List<String> components = trimmed.split(':');
      int hour = int.parse(components[0]);
      int minute = int.parse(components[1]);
      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      print('Error parsing TimeOfDay: $e');
      return TimeOfDay(hour: 0, minute: 0); // Default value if parsing fails
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    Future.delayed(Duration(seconds: 4), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }
}

class FacultyStatusTile extends StatelessWidget {
  final String facultyName;
  final bool isAvailable;
  final String phoneNumber;
  final String email;
  final String location;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const FacultyStatusTile({
    Key? key,
    required this.facultyName,
    required this.isAvailable,
    required this.phoneNumber,
    required this.email,
    required this.location,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          isAvailable ? Icons.check : Icons.close,
          color: Colors.white,
        ),
        backgroundColor: isAvailable ? Colors.green : Colors.red,
      ),
      title: Text(
        facultyName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Available: ${isAvailable ? 'Yes' : 'No'}'),
          Text('Phone: $phoneNumber'),
          Text('Email: $email'),
          Text('Location: $location'),
          Text('Time: ${_formatTime(startTime)} - ${_formatTime(endTime)}'),
        ],
      ),
    );
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final time = TimeOfDay(hour: timeOfDay.hour, minute: timeOfDay.minute);
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dateTime);
  }
}
