import 'package:flutter/material.dart';
import '../main.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _enableNotifications = true; // Sample value for notification settings
  bool _darkThemeEnabled = false; // Sample value for dark theme settings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildAppDetails(),
            const SizedBox(height: 20),
            const Text(
              'App Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildNotificationSetting(),
            const SizedBox(height: 20),
            _buildThemeSetting(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('Creators', 'Rushikesh Gadewar'),
        _buildDetailItem('Help Number', '+91-9321975842'),
        _buildDetailItem('Email', 'rushikeshgadewar@gmail.com'),
        _buildDetailItem('Version', '1.3.0'),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildNotificationSetting() {
    return SwitchListTile(
      title: const Text('Enable Notifications'),
      value: _enableNotifications,
      onChanged: (value) {
        setState(() {
          _enableNotifications = value;
        });
      },
    );
  }

  Widget _buildThemeSetting() {
    return SwitchListTile(
      title: const Text('Light Theme'),
      value: _darkThemeEnabled,
      onChanged: (value) {
        setState(() {
          _darkThemeEnabled = value;
          // Apply theme change here
          navigatorKey.currentState!.pushReplacementNamed('/'); // Reload the app with the new theme
        });
      },
    );
  }
}
