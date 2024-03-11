// lib/screens/HomeScreen.dart
import 'package:flutter/material.dart';
import 'AboutPage.dart';
import 'FacultyLoginPage.dart';
import 'FacultySignupPage.dart';
import 'StudentLoginPage.dart';
import 'StudentSignupPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT Department App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info), // Set color to white
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentLoginPage()),
                );
              },
              child: const Text('Student Login'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentSignupPage()),
                );
              },
              child: const Text('Student Signup'),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FacultyLoginPage()),
                );
              },
              child: const Text('Faculty Login'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FacultySignupPage()),
                );
              },
              child: const Text('Faculty Signup'),
            ),
          ],
        ),
      ),
    );
  }
}

