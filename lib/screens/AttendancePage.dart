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

  const AttendancePage({
    Key? key,
    this.facultyName,
    this.lectureName,
    this.timing,
    this.classroomNumber,
  }) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<Map<String, dynamic>> students = [
    {'sapId': '160', 'name': 'Tanaya Joshi'},
    {'sapId': '161', 'name': 'Ayushi Uttamani'},
    {'sapId': '162', 'name': 'Om Aundhkar'},
    {'sapId': '163', 'name': 'Amey Rane'},
    {'sapId': '164', 'name': 'Vedant Chavan'},
    {'sapId': '165', 'name': 'Adit Kanaji'},
    {'sapId': '166', 'name': 'Varad Patil'},
    {'sapId': '167', 'name': 'Rahul Chougule'},
    {'sapId': '168', 'name': 'Bhavya Majani'},
    {'sapId': '169', 'name': 'Panth Patel'},
    {'sapId': '170', 'name': 'Vaishnavi Kadukar'},
    {'sapId': '171', 'name': 'Rushikesh Gadewar'},
    {'sapId': '172', 'name': 'Kriti Derasadi'},
    {'sapId': '173', 'name': 'Araish Shaikh'},
    {'sapId': '174', 'name': 'Hargun Chandhok'}
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
                Text('Lecture Name: ${widget.lectureName ?? 'Embedded Electronics'}'),
                Text('Timing: ${widget.timing ?? '2:00 PM - 3:00 PM'}'),
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
              pw.Text('Lecture Name: ${widget.lectureName ?? 'Embedded Electronics'}'),
              pw.Text('Timing: ${widget.timing ?? '2:00 PM - 3:00 PM'}'),
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
