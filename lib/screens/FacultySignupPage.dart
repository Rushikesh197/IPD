// lib/screens/FacultySignupPage.dart

import 'package:flutter/material.dart';

class FacultySignupPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FacultySignupPage({super.key});

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
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _performSignup(BuildContext context) {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      _showAlert(context, 'All fields must be filled');
    } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(_nameController.text)) {
      _showAlert(context, 'Invalid characters in name');
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(_emailController.text)) {
      _showAlert(context, 'Invalid email address');
    } else {
      // Validate password strength
      String password = _passwordController.text;
      List<String> requirements = [];

      if (password.length < 8) {
        requirements.add('at least 8 characters');
      }
      if (!_containsUppercase(password)) {
        requirements.add('at least one uppercase letter');
      }
      if (!_containsLowercase(password)) {
        requirements.add('at least one lowercase letter');
      }
      if (!_containsDigit(password)) {
        requirements.add('at least one digit');
      }
      if (!_containsSpecialChar(password)) {
        requirements.add('at least one special character');
      }

      if (requirements.isNotEmpty) {
        _showAlert(
          context,
          'Password must have ${requirements.join(', ')}',
        );
      } else {
        print('Name: ${_nameController.text}');
        print('Email: ${_emailController.text}');
        print('Password: $password');

        _showAlert(context, 'Signup successful');

        Navigator.pushReplacementNamed(context, '/faculty_login');
      }
    }
  }

  bool _containsUppercase(String value) {
    return RegExp(r'[A-Z]').hasMatch(value);
  }

  bool _containsLowercase(String value) {
    return RegExp(r'[a-z]').hasMatch(value);
  }

  bool _containsDigit(String value) {
    return RegExp(r'\d').hasMatch(value);
  }

  bool _containsSpecialChar(String value) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
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
              onPressed: () {
                _performSignup(context);
              },
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
