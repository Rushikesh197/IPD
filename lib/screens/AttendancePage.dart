import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:csv/csv.dart';

class AttendancePage extends StatefulWidget {
  final String? facultyName;
  final String? lectureName;
  final String? timing;
  final String? classroomNumber;
  final String? date;

  const AttendancePage({
    Key? key,
    this.facultyName,
    this.lectureName,
    this.timing,
    this.classroomNumber,
    this.date,
  }) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<Map<String, dynamic>> students = [
    {"sapId": "160", "name": "Tanaya Joshi"},
    {"sapId": "161", "name": "Ayushi Uttamani"},
    {"sapId": "162", "name": "Om Aundhkar"},
    {"sapId": "163", "name": "Amey Rane"},
    {"sapId": "164", "name": "Vedant Chavan"},
    {"sapId": "165", "name": "Adit Kanaji"},
    {"sapId": "166", "name": "Varad Patil"},
    {"sapId": "167", "name": "Rahul Chougule"},
    {"sapId": "168", "name": "Bhavya Majani"},
    {"sapId": "170", "name": "Vaishnavi Kadukar"},
    {"sapId": "171", "name": "Rushikesh Gadewar"},
    {"sapId": "172", "name": "Kriti Derasadi"},
    {"sapId": "173", "name": "Araish Shaikh"},
    {"sapId": "174", "name": "Hargun Chandhok"},
    {"sapId": "175", "name": "Gautam Soni"},
    {"sapId": "177", "name": "Aryan Gupta"},
    {"sapId": "179", "name": "Rohit Rai"},
    {"sapId": "180", "name": "Smit Shah"},
    {"sapId": "181", "name": "Khushi Shah"},
    {"sapId": "182", "name": "Yash Doshi"},
    {"sapId": "183", "name": "Merul Shah"},
    {"sapId": "184", "name": "Krupa Bhayani"},
    {"sapId": "185", "name": "Kely Mistry"},
    {"sapId": "186", "name": "Shabbir Rangwala"},
    {"sapId": "187", "name": "Shivani Patel"},
    {"sapId": "188", "name": "Kushal Vadodaria"},
    {"sapId": "190", "name": "Sarthak Mahale"},
    {"sapId": "191", "name": "Bhavya Poddar"},
    {"sapId": "192", "name": "Isha Patade"},
    {"sapId": "193", "name": "Jainish Jain"},
    {"sapId": "194", "name": "Enrique D'Costa"},
    {"sapId": "195", "name": "Soham Thatte"},
    {"sapId": "196", "name": "Shashank Das"},
    {"sapId": "197", "name": "Isha Mistry"},
    {"sapId": "198", "name": "Anusshka Choudhary"},
    {"sapId": "199", "name": "Krisha Borana"},
    {"sapId": "200", "name": "Nihar Nandoskar"},
    {"sapId": "201", "name": "Arnav More"},
    {"sapId": "202", "name": "Anupkumar Singh"},
    {"sapId": "203", "name": "Umang Jain"},
    {"sapId": "204", "name": "Isha Shah"},
    {"sapId": "205", "name": "Shruti Bhavigadda"},
    {"sapId": "206", "name": "Anurag Lade"},
    {"sapId": "207", "name": "Mohammad Faahad"},
    {"sapId": "208", "name": "Tanvi Bhide"},
    {"sapId": "210", "name": "Ronakk Javeri"},
    {"sapId": "211", "name": "Murtaza Shikari"},
    {"sapId": "212", "name": "Mithil Bavishi"},
    {"sapId": "213", "name": "Viral Dalal"},
    {"sapId": "214", "name": "Nemin Sheth"},
    {"sapId": "216", "name": "Yash Shah"},
    {"sapId": "217", "name": "Palak Shah"},
    {"sapId": "218", "name": "Harsh Chheda"},
    {"sapId": "219", "name": "Keyur Parmar"},
    {"sapId": "220", "name": "Dhimant Morakhia"},
    {"sapId": "221", "name": "Rushit Jhaveri"},
    {"sapId": "222", "name": "Tirth Parekh"},
    {"sapId": "223", "name": "Jay Parmar"},
    {"sapId": "224", "name": "Anuj Bohra"},
    {"sapId": "225", "name": "Sanjal Ghate"},
    {"sapId": "227", "name": "Kartik Dubey"},
    {"sapId": "100", "name": "Hetvi Shah"},
    {"sapId": "101", "name": "Mit Shah"},
    {"sapId": "102", "name": "Jeet Shah"},
    {"sapId": "103", "name": "Rupesh Raut"},
    {"sapId": "110", "name": "Khush Trivedi"},
    {"sapId": "240", "name": "Vihit Khetle"},
    {"sapId": "241", "name": "Nusra Shaikh"},
    {"sapId": "242", "name": "Dhruv Karia"},
    {"sapId": "248", "name": "Vaishnavi Naik"},
    {"sapId": "249", "name": "Jeet Doshi"},
    {"sapId": "267", "name": "Deep Parekh"},
    {"sapId": "278", "name": "Jhenil Parihar"}
  ];

  Map<String, bool> attendanceMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Faculty Name: ${widget.facultyName ?? 'Prof.Arjun Jaiswal'}'),
                Text('Lecture Name: ${widget.lectureName ?? 'Devops'}'),
                Text('Timing: ${widget.timing ?? '9:00 AM - 10:00 AM'}'),
                Text('Date: ${widget.date ?? '15th April, 2024'}'),
                Text('Classroom Number: ${widget.classroomNumber ?? '65'}'),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('SAP ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Attendance')),
                ],
                rows: students.map((student) {
                  final sapId = student['sapId'];
                  final name = student['name'];
                  final isChecked = attendanceMap.containsKey(sapId) ? attendanceMap[sapId] : false;
                  return DataRow(cells: [
                    DataCell(Text(sapId)),
                    DataCell(Text(name)),
                    DataCell(Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          attendanceMap[sapId] = value!;
                        });
                      },
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _exportAttendanceAsPdf();
                },
                child: const Text('Export as PDF'),
              ),
              ElevatedButton(
                onPressed: () {
                  _exportAttendanceAsExcel();
                },
                child: const Text('Export as Excel'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _exportAttendanceAsPdf() async {
    // Request storage permission
    if (!(await Permission.storage.request().isGranted)) {
      _showExportAlert('PDF', 'Storage permission not granted');
      return; // If permission not granted, return
    }

    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Attendance'),
              pw.Text('Faculty Name: ${widget.facultyName ?? 'Prof.Arjun Jaiswal'}'),
              pw.Text('Lecture Name: ${widget.lectureName ?? 'Devops'}'),
              pw.Text('Timing: ${widget.timing ?? '9:00 AM - 10:00 AM'}'),
              pw.Text('Date: ${widget.timing ?? '15th April, 2024'}'),
              pw.Text('Classroom Number: ${widget.classroomNumber ?? '65'}'),
              pw.Table.fromTextArray(
                data: <List<String>>[
                  <String>['SAP ID', 'Name', 'Attendance'],
                  ...students.map((student) => [student['sapId'], student['name'], attendanceMap[student['sapId']] == true ? 'Present' : 'Absent']),
                ],
              ),
            ],
          );
        },
      ),
    );

    // Save the PDF to storage
    final output = await getExternalStorageDirectory();
    final file = File('${output!.path}/attendance.pdf');
    await file.writeAsBytes(await pdf.save());

    // Show export success dialog
    _showExportAlert('PDF', 'Attendance exported as PDF successfully');
  }

  Future<void> _exportAttendanceAsExcel() async {
    // Request storage permission
    if (!(await Permission.storage.request().isGranted)) {
      _showExportAlert('Excel', 'Storage permission not granted');
      return; // If permission not granted, return
    }

    final List<List<dynamic>> csvData = [
      ['SAP ID', 'Name', 'Attendance']
    ];

    students.forEach((student) {
      final sapId = student['sapId'];
      final name = student['name'];
      final attendance = attendanceMap[sapId] == true ? 'Present' : 'Absent';
      csvData.add([sapId, name, attendance]);
    });

    final String csv = const ListToCsvConverter().convert(csvData);

    // Save the CSV to storage
    final output = await getExternalStorageDirectory();
    final file = File('${output!.path}/attendance.csv');
    await file.writeAsString(csv);

    // Show export success dialog
    _showExportAlert('Excel', 'Attendance exported as Excel successfully');
  }

  void _showExportAlert(String fileType, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Export as $fileType'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AttendancePage(),
  ));
}
