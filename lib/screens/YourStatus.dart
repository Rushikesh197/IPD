import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YourStatus extends StatefulWidget {
  const YourStatus({Key? key}) : super(key: key);

  @override
  _YourStatusState createState() => _YourStatusState();
}

class _YourStatusState extends State<YourStatus> {
  bool _isAvailable = false;
  TimeOfDay _startTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 17, minute: 0);
  String _location = '';
  String _phoneNumber = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(now);
    String formattedTime = DateFormat('h:mm a').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Text('Set Your Status'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Date: $formattedDate',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 12.0), // Adjusted line spacing
              Text(
                'Current Time: $formattedTime',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 24.0), // Adjusted line spacing
              Text(
                'Faculty Name:', // Replace with actual faculty name
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Prof. Arjun Jaiswal', // Replace with actual faculty name
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 24.0), // Adjusted line spacing
              Row(
                children: [
                  Text(
                    'Availability:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isAvailable = !_isAvailable;
                      });
                    },
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isAvailable ? Colors.green : Colors.red,
                      ),
                      child: Icon(
                        _isAvailable ? Icons.check : Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0), // Adjusted line spacing
              Text(
                'Timings:\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Row(
                children: [
                  Text(
                    'From:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      _selectStartTime(context);
                    },
                    child: Text(
                      _startTime.format(context),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'To:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      _selectEndTime(context);
                    },
                    child: Text(
                      _endTime.format(context),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0), // Adjusted line spacing
              Text(
                'Location:',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _location = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter location',
                ),
              ),
              SizedBox(height: 24.0), // Adjusted line spacing
              Text(
                'Phone Number:',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter phone number',
                ),
              ),
              SizedBox(height: 24.0), // Adjusted line spacing
              Text(
                'Email:',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter email',
                ),
              ),
              SizedBox(height: 24.0), // Adjusted line spacing
              ElevatedButton(
                onPressed: () {
                  // Save changes logic
                  _saveChanges(context);
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );

  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
      });
    }
  }
}
void _saveChanges(BuildContext context) {
  // Add your save logic here

  // Show alert dialog after saving changes
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Changes Saved'),
        content: Text('Your status has been updated successfully.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Navigate back to StatusNavigator.dart
              Navigator.pop(context); // Close the dialog
              Navigator.pop(context); // Navigate back to StatusNavigator.dart
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}