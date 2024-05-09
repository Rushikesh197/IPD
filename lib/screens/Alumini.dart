//
//
// //llllllllllllllllllllll
//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
//
// class AluminiPage extends StatefulWidget {
//   @override
//   _AluminiPageState createState() => _AluminiPageState();
// }
//
// class _AluminiPageState extends State<AluminiPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alumini Connect'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Text(
//                 'Alumini Connect',
//                 style: TextStyle(fontSize: 28.0),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Container(
//               width: double.infinity, // Take full width
//               padding: EdgeInsets.all(20.0),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(162, 83, 169, 1.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Name: Om Aundhkar',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   InkWell(
//                     onTap: () {
//                       launch('https://www.linkedin.com/in/om-aundhkar');
//                     },
//                     child: Text(
//                       'LinkedIn Profile',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 18,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Phone Number: 229283298',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Email: stud@gmail.com',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 20.0), // Add space between rectangles
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.0), // Add space between rectangles
//             Container(
//               width: double.infinity, // Take full width
//               padding: EdgeInsets.all(20.0),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(162, 83, 169, 1.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Name: Ayushi Uttamani',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   InkWell(
//                     onTap: () {
//                       launch('https://www.linkedin.com/in/ayushi-uttamani');
//                     },
//                     child: Text(
//                       'LinkedIn Profile',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 18,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Phone Number: 229443298',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Email: ayushi@gmail.com',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.0), // Add space between rectangles
//             Container(
//               width: double.infinity, // Take full width
//               padding: EdgeInsets.all(20.0),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(162, 83, 169, 1.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Name: Rushikesh Gadewar',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   InkWell(
//                     onTap: () {
//                       launch('https://www.linkedin.com/in/rushikeshgadewar/');
//                     },
//                     child: Text(
//                       'LinkedIn Profile',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 18,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Phone Number: 22928357588',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Email: rushi@gmail.com',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.0), // Add space between rectangles
//             Container(
//               width: double.infinity, // Take full width
//               padding: EdgeInsets.all(20.0),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(162, 83, 169, 1.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.grey[900],
//     );
//   }
// }


//kkkkkkkkkkkkkk

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class AluminiPage extends StatefulWidget {
//   @override
//   _AluminiPageState createState() => _AluminiPageState();
// }
//
// class _AluminiPageState extends State<AluminiPage> {
//   String _selectedYear = '2023'; // Default selected year
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alumini Connect'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropdownButton<String>(
//               value: _selectedYear,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedYear = newValue!;
//                 });
//               },
//               items: <String>['2023', '2024','2025, ']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20.0),
//             Center(
//               child: Text(
//                 'Alumini Connect',
//                 style: TextStyle(fontSize: 28.0),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Container(
//               width: double.infinity, // Take full width
//               padding: EdgeInsets.all(20.0),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(162, 83, 169, 1.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Name: Om Aundhkar',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   InkWell(
//                     onTap: () {
//                       launch('https://www.linkedin.com/in/om-aundhkar');
//                     },
//                     child: Text(
//                       'LinkedIn Profile',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 18,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Phone Number: 229283298',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Email: stud@gmail.com',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 20.0), // Add space between rectangles
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.0), // Add space between rectangles
//             Container(
//               width: double.infinity, // Take full width
//               padding: EdgeInsets.all(20.0),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(162, 83, 169, 1.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Name: Ayushi Uttamani',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   InkWell(
//                     onTap: () {
//                       launch('https://www.linkedin.com/in/ayushi-uttamani');
//                     },
//                     child: Text(
//                       'LinkedIn Profile',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 18,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Phone Number: 229443298',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Email: ayushi@gmail.com',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.0), // Add space between rectangles
//             Container(
//               width: double.infinity, // Take full width
//               padding: EdgeInsets.all(20.0),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(162, 83, 169, 1.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Name: Rushikesh Gadewar',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   InkWell(
//                     onTap: () {
//                       launch('https://www.linkedin.com/in/rushikeshgadewar/');
//                     },
//                     child: Text(
//                       'LinkedIn Profile',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 18,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Phone Number: 22928357588',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     'Email: rushi@gmail.com',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.grey[900],
//     );
//   }
// }

//ssssssssssssssssssssss
//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class AluminiPage extends StatefulWidget {
//   @override
//   _AluminiPageState createState() => _AluminiPageState();
// }
//
// class _AluminiPageState extends State<AluminiPage> {
//   String _selectedYear = '2023'; // Default selected year
//
//   // Map to hold alumini details for each year
//   final Map<String, List<Map<String, String>>> aluminiData = {
//     '2023': [
//       {
//         'name': 'Om Aundhkar',
//         'linkedin': 'https://www.linkedin.com/in/om-aundhkar',
//         'phoneNumber': '229283298',
//         'email': 'stud@gmail.com',
//       },
//       {
//         'name': 'Ayushi Uttamani',
//         'linkedin': 'https://www.linkedin.com/in/ayushi-uttamani',
//         'phoneNumber': '229443298',
//         'email': 'ayushi@gmail.com',
//       },
//       {
//         'name': 'Rushikesh Gadewar',
//         'linkedin': 'https://www.linkedin.com/in/rushikeshgadewar/',
//         'phoneNumber': '22928357588',
//         'email': 'rushi@gmail.com',
//       },
//     ],
//     '2024': [
//       {
//         'name': 'Amey Rane',
//         'linkedin': 'https://www.linkedin.com/in/amey-rane',
//         'phoneNumber': '229283298',
//         'email': 'amey@gmail.com',
//       },
//       {
//         'name': 'Adit Kanaji',
//         'linkedin': 'https://www.linkedin.com/in/adit-kanaji',
//         'phoneNumber': '229443298',
//         'email': 'adit@gmail.com',
//       },
//       {
//         'name': 'Rahul Chougule',
//         'linkedin': 'https://www.linkedin.com/in/rahul-chougule',
//         'phoneNumber': '22928357588',
//         'email': 'rahul@gmail.com',
//       },
//     ],
//     '2025': [
//       {
//         'name': 'Kriti Derasadi',
//         'linkedin': 'https://www.linkedin.com/in/kriti-derasadi',
//         'phoneNumber': '229283298',
//         'email': 'kriti@gmail.com',
//       },
//       {
//         'name': 'Varad Patil',
//         'linkedin': 'https://www.linkedin.com/in/varad-patil',
//         'phoneNumber': '229443298',
//         'email': 'varad@gmail.com',
//       },
//       {
//         'name': 'Tanaya Joshi',
//         'linkedin': 'https://www.linkedin.com/in/tanaya-joshi',
//         'phoneNumber': '22928357588',
//         'email': 'tanaya@gmail.com',
//       },
//     ],
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> selectedYearAlumini = aluminiData[_selectedYear] ?? [];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alumni Connect'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropdownButton<String>(
//               value: _selectedYear,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedYear = newValue!;
//                 });
//               },
//               items: <String>['2023', '2024', '2025']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20.0),
//             Center(
//               child: Text(
//                 'Alumni Connect',
//                 style: TextStyle(fontSize: 28.0),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ...selectedYearAlumini.map((alum) {
//               return Container(
//                 margin: EdgeInsets.only(bottom: 20.0),
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(162, 83, 169, 1.0),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Name: ${alum['name']}',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                       SizedBox(height: 12.0),
//                       InkWell(
//                         onTap: () {
//                           launch(alum['linkedin'] ?? '');
//                         },
//                         child: Text(
//                           'LinkedIn Profile',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 18,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.0),
//                       Text(
//                         'Phone Number: ${alum['phoneNumber']}',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                       SizedBox(height: 12.0),
//                       Text(
//                         'Email: ${alum['email']}',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.grey[900],
//     );
//   }
// }


//jjjjjjjjjjjjjjjjjjjjj

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AluminiPage extends StatefulWidget {
  @override
  _AluminiPageState createState() => _AluminiPageState();
}

class _AluminiPageState extends State<AluminiPage> {
  String _selectedYear = '2023'; // Default selected year

  // Map to hold alumini details for each year
  final Map<String, List<Map<String, String>>> aluminiData = {
    '2023': [
      {
        'name': 'Om Aundhkar',
        'linkedin': 'https://www.linkedin.com/in/om-aundhkar',
        'phoneNumber': '229283298',
        'email': 'stud@gmail.com',
      },
      {
        'name': 'Ayushi Uttamani',
        'linkedin': 'https://www.linkedin.com/in/ayushi-uttamani',
        'phoneNumber': '229443298',
        'email': 'ayushi@gmail.com',
      },
      {
        'name': 'Rushikesh Gadewar',
        'linkedin': 'https://www.linkedin.com/in/rushikeshgadewar/',
        'phoneNumber': '22928357588',
        'email': 'rushi@gmail.com',
      },
    ],
    '2024': [
      {
        'name': 'Amey Rane',
        'linkedin': 'https://www.linkedin.com/in/amey-rane-11951a250/',
        'phoneNumber': '229283298',
        'email': 'amey@gmail.com',
      },
      {
        'name': 'Adit Kanaji',
        'linkedin': 'https://www.linkedin.com/in/adit-kanaji/',
        'phoneNumber': '229443298',
        'email': 'adit@gmail.com',
      },
      {
        'name': 'Rahul Chougule',
        'linkedin': 'https://www.linkedin.com/in/rahulchougule15/',
        'phoneNumber': '22928357588',
        'email': 'rahul@gmail.com',
      },
    ],
    '2025': [
      {
        'name': 'Kriti Derasadi',
        'linkedin': 'https://www.linkedin.com/in/kriti-derasadi-1086b522a/',
        'phoneNumber': '229283298',
        'email': 'kriti@gmail.com',
      },
      {
        'name': 'Varad Patil',
        'linkedin': 'https://www.linkedin.com/in/varadpatil25/',
        'phoneNumber': '229443298',
        'email': 'varad@gmail.com',
      },
      {
        'name': 'Tanaya Joshi',
        'linkedin': 'https://www.linkedin.com/in/tanaya-joshi-4b95b7230/',
        'phoneNumber': '22928357588',
        'email': 'tanaya@gmail.com',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> selectedYearAlumini = aluminiData[_selectedYear] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Alumni Connect'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedYear = newValue!;
                });
              },
              items: <String>['2023', '2024', '2025']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(
                'Alumni Connect',
                style: TextStyle(fontSize: 28.0),
              ),
            ),
            SizedBox(height: 20.0),
            ...selectedYearAlumini.map((alum) {
              return SizedBox(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(162, 83, 169, 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${alum['name']}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 12.0),
                        InkWell(
                          onTap: () {
                            launch(alum['linkedin'] ?? '');
                          },
                          child: Text(
                            'LinkedIn Profile',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Phone Number: ${alum['phoneNumber']}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Email: ${alum['email']}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}

