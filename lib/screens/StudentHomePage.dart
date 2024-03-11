import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../main.dart';
import 'ChatRoom.dart'; // Import the ChatRoom.dart
import 'Notice.dart'; // Import the Notice.dart
import 'UserProfile.dart';
import 'Settings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AroundCampus.dart';
import 'FacultyStatus.dart';
import 'MarksTarget.dart';

class StudentHomePage extends StatelessWidget {
  final String studentName; // Pass the student's name from the login page

  const StudentHomePage({Key? key, required this.studentName});

  // Add a new widget to represent the line graph
  Widget _buildCGPAGraph(BuildContext context) {
    final List<FlSpot> cgpaData = [
      FlSpot(1, 9.0),
      FlSpot(2, 9.14),
      FlSpot(3, 9.27),
      FlSpot(4, 8.83),
      FlSpot(5, 9.26),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Academics\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              IconButton(
                icon: Icon(Icons.info),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MarksTarget()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          AspectRatio(
            aspectRatio: 2.0,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 6,
                minY: 6,
                maxY: 10,
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22, // add spacing
                    margin: 10, // add margin
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 1:
                          return 'Sem 1';
                        case 2:
                          return 'Sem 2';
                        case 3:
                          return 'Sem 3';
                        case 4:
                          return 'Sem 4';
                        case 5:
                          return 'Sem 5';
                      }
                      return '';
                    },
                    getTextStyles: (value) => TextStyle(color: Colors.white),
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40, // add spacing
                    margin: 12, // add margin
                    // add axis name
                    getTextStyles: (value) => TextStyle(color: Colors.white),
                    getTitles: (value) {
                      return value.toString();
                    },
                  ),
                ),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: cgpaData,
                    isCurved: true,
                    colors: [Colors.blue],
                    barWidth: 3,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
    DateFormat('EEEE, MMMM d, y HH:mm').format(DateTime.now());

    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
            title: Text('Welcome, Rushikesh G !'),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications), // Notice icon
                onPressed: () {
                  // Navigate to the notice page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NoticePage()),
                  );
                },
              ),
            ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(162, 83, 169, 1.0),
                ),
                child: const Text(
                  'Additional Features',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Edit Profile'),
                onTap: () {
                  _showEditProfileAlert(context);
                },
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  _showSettingsAlert(context);
                },
              ),
              ListTile(
                title: const Text('Linkedin'),
                onTap: () {
                  _openApplication(
                    'https://www.linkedin.com/',
                    'LinkedIn',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('Whatsapp'),
                onTap: () {
                  _openApplication(
                    'whatsapp://send?phone=<PHONE_NUMBER>',
                    'WhatsApp',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('MS Teams'),
                onTap: () {
                  _openApplication(
                    'https://www.microsoft.com/en-in/microsoft-teams/log-in',
                    'MS Teams',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('OneDrive'),
                onTap: () {
                  _openApplication(
                    'https://onedrive.live.com/login/',
                    'OneDrive',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('SAP Academic Portal'),
                onTap: () {
                  _openApplication(
                    'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
                    'SAP Academic Portal',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('Attendance Tracker'),
                onTap: () {
                  _openApplication(
                    'https://portal.svkm.ac.in/usermgmt/loginSvkm',
                    'Attendance Tracker',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('Faculty Feedback'),
                onTap: () {
                  _openApplication(
                    'https://feedback-portal-djsce.netlify.app/',
                    'Faculty Feedback',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('Around Campus'),
                onTap: () {
                  // Navigate to the AroundCampus screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AroundCampus()),
                  );
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  _confirmLogout(context);
                },
              ),
            ],
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                formattedDateTime,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Your Lectures',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView(
                              children: const [
                                ListTile(
                                  title: Text('Power Electronics'),
                                  subtitle: Text(
                                      'Time: 7:00 AM - 8:00 AM, Classroom: 45, Faculty: Prof. Tanaji Biradar'),
                                ),
                                ListTile(
                                  title: Text(
                                      'Image Analysis And Computer Vision'),
                                  subtitle: Text(
                                      'Time: 8:00 AM - 9:00 AM, Classroom: 33, Faculty: Prof. Neha Katre'),
                                ),
                                ListTile(
                                  title: Text('Big Data Analytics '),
                                  subtitle: Text(
                                      'Time: 9:00 AM - 10:00 AM, Classroom: 63, Faculty: Prof. Harshal Dalvi'),
                                ),
                                ListTile(
                                  title: Text(
                                      'Parallel And Distrubuted Systems'),
                                  subtitle: Text(
                                      'Time: 10:00 AM - 11:00 AM, Classroom: 65, Faculty: Prod. Vinaya Savant'),
                                ),
                                ListTile(
                                  title: Text('Soft Computing'),
                                  subtitle: Text(
                                      'Time: 11:00 AM - 12:00 PM, Classroom: 66, Faculty: Prof. Savyasacchi Pandit'),
                                ),
                                ListTile(
                                  title: Text('Devops'),
                                  subtitle: Text(
                                      'Time: 12:00 PM - 1:00 PM, Classroom: 55, Faculty: Prof. Monali Sankhe'),
                                ),
                                ListTile(
                                  title: Text('Software Engineering'),
                                  subtitle: Text(
                                      'Time: 1:00 PM - 2:00 PM, Classroom: 43, Faculty: Prof. Richa Sharma'),
                                ),
                                ListTile(
                                  title: Text('Antenna Technology'),
                                  subtitle: Text(
                                      'Time: 2:00 PM - 3:00 PM, Classroom: 33, Faculty: Prof. Amey Kadam'),
                                ),
                                ListTile(
                                  title: Text('Data Structures'),
                                  subtitle: Text(
                                      'Time: 3:00 PM - 4:00 PM, Classroom: 62, Faculty: Prof. Stevina Diaz'),
                                ),
                                ListTile(
                                  title: Text('AR/VR'),
                                  subtitle: Text(
                                      'Time: 4:00 PM - 5:00 PM, Classroom: 35, Faculty: Prof. Arjun Jaiswal'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Your Study Groups',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          GestureDetector(
                            onTap: () {
                              _navigateToChatRoom(context, 'Competitive Coding');
                            },
                            child: _buildStudyGroupTile('Competitive Coding'),
                          ),
                          GestureDetector(
                            onTap: () {
                              _navigateToChatRoom(context, 'Data Structures Help');
                            },
                            child: _buildStudyGroupTile('Data Structures Help'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildCGPAGraph(context), // Add the line graph here
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FacultyStatus()),
            );
          },
          child: Container(
            color: Color.fromRGBO(162, 83, 169, 1.0),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.info, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Status',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    bool logoutConfirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false); // Logout not confirmed
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true); // Logout confirmed
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    if (logoutConfirmed ?? false) {
      // If logout is confirmed, navigate to main.dart
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()), // Replace MyApp with your main.dart class name
      );
    }

    return logoutConfirmed ?? false;
  }

  void _showEditProfileAlert(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserProfile()),
    );
  }

  void _showSettingsAlert(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void _openApplication(String url, String appName, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Open $appName?'),
          content: Text('Do you want to open $appName?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Could not launch $appName.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Open'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cancel logout
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Confirm logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStudyGroupTile(String groupName) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.group, size: 40),
            const SizedBox(height: 8),
            Text(
              groupName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToChatRoom(BuildContext context, String groupName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatRoom(groupName: groupName),
      ),
    );
  }
}
