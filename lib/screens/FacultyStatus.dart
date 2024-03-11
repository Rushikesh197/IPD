import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:flutter/material.dart';


// List of example first names and last names
List<String> firstNames = [
  'John', 'Jane', 'David', 'Emily', 'Michael', 'Sophia', 'Robert', 'Emma', 'William', 'Olivia'
];
List<String> lastNames = [
  'Smith', 'Johnson', 'Brown', 'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin'
];

String generateRandomName(Random random) {
  String firstName = firstNames[random.nextInt(firstNames.length)];
  String lastName = lastNames[random.nextInt(lastNames.length)];
  return '$firstName $lastName';
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
        itemCount: 6, // Generate 6 dummy tiles
        itemBuilder: (context, index) {
          // Generate random data for each tile
          Random random = Random();
          String facultyName = generateRandomName(random);
          String designation = ['Professor', 'Associate Professor', 'Assistant Professor'][random.nextInt(3)];
          String department = ['IT Department', 'Computer Science', 'Electrical Engineering'][random.nextInt(3)];
          bool isAvailable = random.nextBool();
          String phoneNumber = '1234567890';
          String email = 'faculty${random.nextInt(100)}@example.com';
          String location = 'Location ${random.nextInt(100)}';
          TimeOfDay startTime = TimeOfDay(hour: random.nextInt(24), minute: random.nextInt(60));
          TimeOfDay endTime = TimeOfDay(hour: random.nextInt(24), minute: random.nextInt(60));

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
