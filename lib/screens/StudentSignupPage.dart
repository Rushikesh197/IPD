import 'package:flutter/material.dart';

class StudentSignupPage extends StatelessWidget {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  StudentSignupPage({super.key});

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
                  // Redirect to the student login page after successful signup
                  Navigator.pushReplacementNamed(context, '/student_login');
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
  void _performSignup(BuildContext context) {
    // Check if any of the fields is empty
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      // Display an alert for empty fields
      _showAlert(context, 'All fields must be filled');
    } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(_nameController.text)) {
      // Check if the name contains only letters and spaces
      _showAlert(context, 'Invalid characters in name');
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(_emailController.text)) {
      // Check if the email is valid
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
        // Display an alert for missing password requirements
        _showAlert(
          context,
          'Password must have ${requirements.join(', ')}',
        );
      } else {
        // Print the credentials in the terminal
        print('Name: ${_nameController.text}');
        print('Email: ${_emailController.text}');
        print('Password: $password');

        // Display an alert for successful signup
        _showAlert(context, 'Signup successful');

        // Redirect to the student login page after successful signup
        Navigator.pushReplacementNamed(context, '/student_login');
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
        title: const Text('Student Signup'),
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
              onPressed: () {
                // Implement student signup logic here
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
