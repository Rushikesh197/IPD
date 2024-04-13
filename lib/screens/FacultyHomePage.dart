import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'ChatRoom.dart'; // Import the ChatRoom.dart
import 'Notice.dart'; // Import the Notice.dart
import 'UserProfile.dart';
import 'Settings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:url_launcher/url_launcher.dart';
import 'AroundCampus.dart';
import 'AttendancePage.dart';
import 'StatusNavigator.dart';



class FacultyHomePage extends StatelessWidget {
  final String facultyName;

  const FacultyHomePage({Key? key, required this.facultyName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = DateFormat('EEEE, MMMM d, y HH:mm').format(DateTime.now());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello, Arjun Jaiswal !'),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Navigate to the notice page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NoticePage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.check), // Icon for attendance marking
                  onPressed: () {
                    // Navigate to the attendance page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AttendancePage()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
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
              _buildApplicationTile(
                title: 'Linkedin',
                url: 'https://www.linkedin.com/',
                context: context,
              ),
              _buildApplicationTile(
                title: 'Whatsapp',
                url: 'whatsapp://send?phone=<PHONE_NUMBER>',
                context: context,
              ),
              _buildApplicationTile(
                title: 'MS Teams',
                url: 'https://www.microsoft.com/en-in/microsoft-teams/log-in',
                context: context,
              ),
              _buildApplicationTile(
                title: 'OneDrive',
                url: 'https://onedrive.live.com/login/',
                context: context,
              ),
              _buildApplicationTile(
                title: 'SAP Academic Portal',
                url: 'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
                context: context,
              ),
              _buildApplicationTile(
                title: 'Attendance Tracker',
                url: 'https://portal.svkm.ac.in/usermgmt/loginSvkm',
                context: context,
              ),
              _buildApplicationTile(
                title: 'Faculty Feedback',
                url: 'https://feedback-portal-djsce.netlify.app/',
                context: context,
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
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView(
                              children: const [
                                ListTile(
                                  title: Text('Data Structures and Algorithms'),
                                  subtitle: Text('Time: 7:00 AM - 8:00 AM, Classroom: 45'),
                                ),
                                ListTile(
                                  title: Text('Devops Lab'),
                                  subtitle: Text('Time: 8:00 AM - 10:00 AM, Classroom: Lab 2'),
                                ),
                                ListTile(
                                  title: Text('Artificial Intelligence'),
                                  subtitle: Text('Time: 10:00 AM - 11:00 AM, Classroom: 65'),
                                ),
                                ListTile(
                                  title: Text('Soft Computing'),
                                  subtitle: Text('Time: 11:00 AM - 12:00 PM, Classroom: 66'),
                                ),
                                ListTile(
                                  title: Text('Software Engineering'),
                                  subtitle: Text('Time: 12:00 PM - 1:00 PM, Classroom: 55'),
                                ),
                                ListTile(
                                  title: Text('Lunch Break'),
                                  subtitle: Text('Time: 1:00 PM - 1:30 PM, Classroom: NULL'),
                                ),
                                ListTile(
                                  title: Text('Big Data Analysis'),
                                  subtitle: Text('Time: 1:30 PM - 2:30 PM, Classroom: 43'),
                                ),
                                ListTile(
                                  title: Text('Statistical Analysis Lab'),
                                  subtitle: Text('Time: 2:30 PM - 4:30 PM, Classroom: Lab 3'),
                                ),
                                ListTile(
                                  title: Text('Advanced Data Structures'),
                                  subtitle: Text('Time: 4:30 PM - 5:30 PM, Classroom: 35'),
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
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                              _navigateToChatRoom(context, 'IPD Groups');
                            },
                            child: _buildStudyGroupTile('IPD Groups'),
                          ),
                        ],
                      ),
                    ),
                    // Add the line graph here
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
              MaterialPageRoute(builder: (context) => StatusNavigator()),
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

// Rest of the code...
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
    // Show an alert window asking the user if they want to open the application
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Open $appName?'),
          content: Text('Do you want to open $appName?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  // Handle error
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
                Navigator.of(context).pop();
              },
              child: const Text('Open'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildApplicationTile({required String title, required String url, required BuildContext context}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        _openApplication(url, title, context);
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

