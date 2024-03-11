import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final String _userId = '60003210171'; // Sample user ID
  String _name = 'Rushikesh Gadewar'; // Sample name
  String _email = 'rushikeshgadewar@icloud.com'; // Sample email
  String _password = 'rushi123'; // Sample password

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _emailController.text = _email;
    _passwordController.text = _password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey, // Placeholder color for profile picture
                ),
                // Placeholder for profile picture, you can replace it with an actual profile picture
                child: const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTextField('User ID', _userId, false, TextEditingController(text: _userId)),
            const SizedBox(height: 20.0),
            _buildTextField('Name', _nameController.text, true, _nameController),
            const SizedBox(height: 20.0),
            _buildTextField('Email', _emailController.text, true, _emailController),
            const SizedBox(height: 20.0),
            _buildTextField('Password', _passwordController.text, true, _passwordController),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save changes functionality
                  _saveChanges();
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value, bool enabled, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _saveChanges() {
    // Implement save changes functionality here
    // You can get updated values from _nameController, _emailController, and _passwordController
    // and perform necessary actions like updating the user profile
    setState(() {
      _name = _nameController.text;
      _email = _emailController.text;
      _password = _passwordController.text;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save Changes'),
          content: const Text('Changes saved successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the AlertDialog
                Navigator.pop(context); // Pop the current route (UserProfile)
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
