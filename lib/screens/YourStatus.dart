import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YourStatus extends StatefulWidget {
  const YourStatus({Key? key}) : super(key: key);

  @override
  _YourStatusState createState() => _YourStatusState();
}

class _YourStatusState extends State<YourStatus> {
  late User? _currentUser;

  bool _isAvailable = false;
  TimeOfDay _startTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 17, minute: 0);
  String _location = '';
  String _phoneNumber = '';
  String _email = '';

  Future<void> _getCurrentUser() async {
    _currentUser = FirebaseAuth.instance.currentUser;
    setState(() {});
  }

  Future<void> _saveChanges(BuildContext context) async {
    try {
      if (_currentUser == null) {
        throw Exception('User not authenticated.');
      }

      final facultyRef = FirebaseFirestore.instance.collection('faculties').doc(_currentUser!.uid);

      final data = {
        'displayName': _currentUser!.displayName,
        'available': _isAvailable,
        'startTime': _startTime.format(context),
        'endTime': _endTime.format(context),
        'location': _location,
        'phoneNumber': _phoneNumber,
        'email': _email,
      };

      await facultyRef.set(data);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Changes Saved'),
            content: Text('Your status has been updated successfully.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      print("Error saving changes: $error");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to save changes. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Date: $formattedDate', style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 12.0),
            Text('Current Time: $formattedTime', style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 24.0),
            Text('Faculty Name:', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(_currentUser?.displayName ?? 'Loading...', style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 24.0),
            Row(
              children: [
                Text('Availability:', style: TextStyle(fontSize: 16.0)),
                SizedBox(width: 8.0),
                GestureDetector(
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
            SizedBox(height: 24.0),
            Row(
              children: [
                Text('From:', style: TextStyle(fontSize: 16.0)),
                SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () => _selectTime(context, true),
                  child: Text(_startTime.format(context), style: TextStyle(fontSize: 16.0)),
                ),
                SizedBox(width: 16.0),
                Text('To:', style: TextStyle(fontSize: 16.0)),
                SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () => _selectTime(context, false),
                  child: Text(_endTime.format(context), style: TextStyle(fontSize: 16.0)),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Text('Location:', style: TextStyle(fontSize: 16.0)),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _location = value;
                });
              },
              decoration: InputDecoration(hintText: 'Enter location'),
            ),
            SizedBox(height: 24.0),
            Text('Phone Number:', style: TextStyle(fontSize: 16.0)),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _phoneNumber = value;
                });
              },
              decoration: InputDecoration(hintText: 'Enter phone number'),
            ),
            SizedBox(height: 24.0),
            Text('Email:', style: TextStyle(fontSize: 16.0)),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(hintText: 'Enter email'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                _saveChanges(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
