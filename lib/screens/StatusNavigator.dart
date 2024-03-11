import 'package:flutter/material.dart';
import 'YourStatus.dart';
import 'FacultyStatus.dart';

class StatusNavigator extends StatelessWidget {
  const StatusNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatusTile(
              key: Key('yourStatus'), // Adding key
              title: 'Your Status',
              leftIcon: Icons.person,
              rightIcon: Icons.arrow_forward,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourStatus()),
                );
              },
            ),
            SizedBox(height: 16.0),
            StatusTile(
              key: Key('facultyStatus'), // Adding key
              title: 'Faculty Status',
              leftIcon: Icons.group,
              rightIcon: Icons.arrow_forward,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FacultyStatus()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StatusTile extends StatelessWidget {
  final String title;
  final IconData leftIcon;
  final IconData rightIcon;
  final VoidCallback onTap;

  const StatusTile({
    required Key key, // Change @required to required for null safety
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(leftIcon),
                SizedBox(width: 12.0),
                Text(
                  title,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Icon(rightIcon),
          ],
        ),
      ),
    );
  }
}
