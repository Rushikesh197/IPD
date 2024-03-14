



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'FacultySignupPage.dart'; // Import the corresponding signup page
import 'FacultyHomePage.dart'; // Import the Faculty home page

class FacultyLoginPage extends StatefulWidget {
  const FacultyLoginPage({super.key});

  @override
  State<FacultyLoginPage> createState() => _FacultyLoginPageState();
}

class _FacultyLoginPageState extends State<FacultyLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextFields for email and password
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
              onPressed: _signInWithEmailAndPassword,
              child: const Text('Login'),
            ),

            const SizedBox(height: 16.0),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FacultySignupPage()),
                );
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        _showAlertDialog(context, 'Fields cannot be empty.');
        return;
      }

      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
        _showAlertDialog(context, 'Invalid email format.');
        return;
      }

      // Perform Firebase authentication
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to Faculty home page on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FacultyHomePage(facultyName: 'Faculty'), // Pass Faculty's name here
        ),
      );
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          _showAlertDialog(context, 'User not found.');
          break;
        case 'wrong-password':
          _showAlertDialog(context, 'Incorrect password.');
          break;
        case 'invalid-email':
          _showAlertDialog(context, 'Invalid email format.');
          break;
        default:
          _showAlertDialog(context, 'Login failed. Please try again.');
      }
    } catch (error) {
      print('Login error: $error'); // Log unexpected errors
      _showAlertDialog(context, 'An error occurred. Please try again.');
    }
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

