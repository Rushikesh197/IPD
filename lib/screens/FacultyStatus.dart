import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

// List of example names and locations
List<String> facultyNames = [
  'Vinaya Savant', 'Arjun Jaiswal', 'Abhijit Joshi', 'Neha Katre', 'Richa Sharma', 'Harshal Dalvi', 'Sharvari Patil', 'Savyasacchi Pandit', 'Monali Sankhe', 'Neha Ram'
];

// Map of faculty names to their respective locations
Map<String, String> facultyLocations = {
  'Vinaya Savant': 'IT DEPT 6th Floor HOD Cabin',
  'Arjun Jaiswal': 'CSDS DEPT 5th Floor Cubicle 20',
  'Abhijit Joshi': 'AIML DEPT 3rd Floor Cabin',
  'Neha Katre': 'CS DEPT 6th Floor Cubicle 3',
  'Richa Sharma': 'CSDS DEPT 5th Floor Cubicle 6',
  'Harshal Dalvi': 'CSDS DEPT 5th Floor Cubicle 7',
  'Sharvari Patil': 'CSDS DEPT 5th Floor Cubicle 8',
  'Savyasacchi Pandit': 'Bio-Med DEPT 4th Floor Cubicle 5',
  'Monali Sankhe': 'CSDS DEPT 5th Floor Cubicle 10',
  'Neha Ram': 'CSDS DEPT 5th Floor Cubicle 13',
};

String generateRandomPhoneNumber(Random random) {
  // Generate a random phone number with 10 digits
  String phoneNumber = '';
  for (int i = 0; i < 10; i++) {
    phoneNumber += random.nextInt(10).toString();
  }
  return phoneNumber;
}

class FacultyStatus extends StatelessWidget {
  const FacultyStatus({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Status'),
      ),
      body: ListView.builder(
        itemCount: facultyNames.length,
        itemBuilder: (context, index) {
          // Retrieve specific data for each faculty member
          String facultyName = facultyNames[index];
          String designation = ['Professor', 'Associate Professor', 'Assistant Professor'][Random().nextInt(3)];
          String department = ['IT Department', 'CS Department', 'CS-DS Department'][Random().nextInt(3)];
          bool isAvailable = Random().nextBool();
          String phoneNumber = generateRandomPhoneNumber(Random());
          String email = '${facultyName.toLowerCase().replaceAll(' ', '')}@svkm.djsce.com'; // Generate email ID
          String location = facultyLocations[facultyName] ?? 'Location not specified'; // Retrieve location from the map

          // Generate random start time between 7:30 AM and 5:30 PM
          int startHour = 7 + Random().nextInt(11); // Random hour between 7 and 17 (5 PM)
          int startMinute = Random().nextInt(31); // Random minute between 0 and 30
          TimeOfDay startTime = TimeOfDay(hour: startHour, minute: startMinute);

          // Generate random end time between start time and 5:30 PM
          int endHour = startHour + 1 + Random().nextInt(11); // Random hour between startHour + 1 and 17 (5 PM)
          int endMinute = 30 + Random().nextInt(31); // Random minute between 30 and 59
          if (endHour == 17) {
            // If the end time reaches 5 PM, adjust the minute to be between 0 and 29
            endMinute = Random().nextInt(30);
          }
          TimeOfDay endTime = TimeOfDay(hour: endHour, minute: endMinute);

          // Convert start time to 12-hour format
          String formattedStartTime = DateFormat('h:mm a').format(DateTime(2024, 4, 13, startTime.hour, startTime.minute));

          // Convert end time to 12-hour format
          String formattedEndTime = DateFormat('h:mm a').format(DateTime(2024, 4, 13, endTime.hour, endTime.minute));

          return FacultyStatusTile(
            facultyName: facultyName,
            designation: designation,
            department: department,
            isAvailable: isAvailable,
            phoneNumber: phoneNumber,
            email: email,
            location: location,
            startTime: startTime,
            endTime: endTime,
          );
        },
      ),
    );
  }
}

class FacultyStatusTile extends StatelessWidget {
  final String facultyName;
  final String designation;
  final String department;
  final bool isAvailable;
  final String phoneNumber;
  final String email;
  final String location;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const FacultyStatusTile({
    Key? key,
    required this.facultyName,
    required this.designation,
    required this.department,
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
          Text('Designation: $designation'),
          Text('Department: $department'),
          Text('Available: ${isAvailable ? 'Yes' : 'No'}'),
          Text('Phone: $phoneNumber'),
          Text('Email: $email'),
          Text('Location: $location'),
          Text('Time: ${startTime.format(context)} - ${endTime.format(context)}'),
        ],
      ),
      onTap: () {
        // Add onTap functionality if needed
      },
    );
  }
}
