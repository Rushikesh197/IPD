import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'StudentSignupPage.dart'; // Import the corresponding signup page
import 'StudentHomePage.dart'; // Import the student home page
//
class StudentLoginPage extends StatelessWidget {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // signIn()async{
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
  // }

  signIn() async{
   await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    
  }



  StudentLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Add your student login form widgets here

            // Example: TextFields for email and password
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),

            const SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: (()=>signIn()),
              //   // Implement student login logic here
              //   _performLogin(context);
              child: const Text('Login'),
            ),

            // ElevatedButton(
            //     onPressed: (()=>signIn()) => _performLogin(context), // Call the function correctly
            //   child: const Text('Login'),
            // ),


            const SizedBox(height: 16.0),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentSignupPage()),
                );
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }

  void _performLogin(BuildContext context) {
    // Hardcoded email and password for demonstration
    String hardcodedEmail = 'student@gmail.com';
    String hardcodedPassword = 'student';

    String enteredEmail = _emailController.text.trim();
    String enteredPassword = _passwordController.text.trim();

    if (enteredEmail.isEmpty || enteredPassword.isEmpty) {
      _showAlertDialog(context, 'Fields cannot be empty.');
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(enteredEmail)) {
      _showAlertDialog(context, 'Invalid email format.');
      return;
    }

    if (enteredEmail != hardcodedEmail || enteredPassword != hardcodedPassword) {
      _showAlertDialog(context, 'Incorrect email or password.');
      return;
    }

    // Navigate to the student home page after successful login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const StudentHomePage(studentName: 'Student'), // Pass student's name here
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
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




