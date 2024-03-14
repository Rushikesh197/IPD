

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FacultySignupPage extends StatelessWidget {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FacultySignupPage({Key? key}) : super(key: key);

  // Function to show an alert dialog
  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (message == 'Signup successful') {
                  // Redirect to the Faculty login page after successful signup
                  Navigator.pushReplacementNamed(context, '/faculty_login');
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to perform signup
  Future<void> _performSignup(BuildContext context) async {
    try {
      // Create user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Display an alert for successful signup
      _showAlert(context, 'Signup successful');
    } catch (error) {
      // Display an alert for unsuccessful signup
      _showAlert(context, 'Signup failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextFields for name, email, password
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
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
              onPressed: () => _performSignup(context),
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}

