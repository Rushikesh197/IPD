import 'package:flutter/material.dart';

class MarksTarget extends StatefulWidget {
  @override
  _MarksTargetState createState() => _MarksTargetState();
}

class _MarksTargetState extends State<MarksTarget> {
  List<Subject> subjects = [
    Subject(name: "Big Data Analytics"),
    Subject(name: "Parallel And Distrubuted Computing"),
    Subject(name: "Image Analysis And Computer Vision"),
    Subject(name: "Soft Computing"),
    Subject(name: "Software Engineering"),
    Subject(name: "Devops"),
    // Add more subjects here as needed
  ];

  double targetCGPA = 9.0;
  double targetvalue = 90.0; // Default target value for CGPA 9+

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marks Target'),
        actions: [
          DropdownButton<double>(
            value: targetvalue,
            items: [
              DropdownMenuItem<double>(
                value: 90.0,
                child: Text('9+ CGPA'),
              ),
              DropdownMenuItem<double>(
                value: 80.0,
                child: Text('8+ CGPA'),
              ),
              DropdownMenuItem<double>(
                value: 70.0,
                child: Text('7+ CGPA'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                targetvalue = value!;
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return SubjectTile(subject: subjects[index], targetvalue: targetvalue);
        },
      ),
    );
  }
}

class Subject {
  String name;

  Subject({required this.name});
}

class SubjectTile extends StatefulWidget {
  final Subject subject;
  final double targetvalue;

  const SubjectTile({required this.subject, required this.targetvalue});

  @override
  _SubjectTileState createState() => _SubjectTileState();
}

class _SubjectTileState extends State<SubjectTile> {
  TextEditingController _termTest1Controller = TextEditingController();
  TextEditingController _termTest2Controller = TextEditingController();
  double termTest1Marks = 0.0;
  double termTest2Marks = 0.0;
  double requiredTermTest2Marks = 0.0;
  double requiredEndSemesterMarks = 0.0;

  @override
  void dispose() {
    _termTest1Controller.dispose();
    _termTest2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              widget.subject.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildMarksTextField("Term Test 1", _termTest1Controller),
          _buildMarksTextField("Term Test 2", _termTest2Controller),
          _buildRequiredMarksTile(),
        ],
      ),
    );
  }

  Widget _buildMarksTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            if (label == "Term Test 1") {
              termTest1Marks = double.parse(value);
              requiredTermTest2Marks = 46 - termTest1Marks; // Adjusted for 25 marks, safe zone 23
            } else if (label == "Term Test 2") {
              termTest2Marks = double.parse(value);
              requiredEndSemesterMarks = widget.targetvalue - (termTest1Marks + termTest2Marks) / 2; // Adjusted for 25 marks
            }
          });
        },
      ),
    );
  }

  Widget _buildRequiredMarksTile() {
    double averageTermTestMarks = (termTest1Marks + termTest2Marks) / 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Average Term Test Marks: $averageTermTestMarks"),
          Text("Required Marks for Term Test 2: $requiredTermTest2Marks"),
          Text("Required Marks for End Semester: $requiredEndSemesterMarks"),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MarksTarget(),
  ));
}
