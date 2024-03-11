import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notices'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notices Section
            _buildSectionHeader('Notices'),
            _buildNoticeItem(
              title: 'Postponement Of Exam',
              description: 'This is an important notice regarding postponement of Maths Exam.',
            ),
            _buildNoticeItem(
              title: 'Holiday On 22/02/2024',
              description: 'Holiday is declared on 22nd Feb 2024, Thursday.',
            ),
            // Notifications Section
            _buildSectionHeader('Notifications'),
            _buildNotificationItem(
              title: 'New Message Posted In Competitive Coding',
              description: 'You have received a new message from Prof. A.R. Joshi.',
            ),
            _buildNotificationItem(
              title: 'Reminder To Submit Assignment',
              description: 'Don\'t forget about tomorrow\'s Assignment Deadline.',
            ),
            // Announcements Section
            _buildSectionHeader('Announcements'),
            _buildAnnouncementItem(
              title: 'Welcome to the New Semester!',
              description: 'We are excited to start the new semester.',
            ),
            _buildAnnouncementItem(
              title: 'Upcoming Event',
              description: 'Join us for the annual Alumni fair on 24th Feb 2024.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNoticeItem({required String title, required String description}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }

  Widget _buildNotificationItem({required String title, required String description}) {
    return ListTile(
      leading: const Icon(Icons.notifications),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }

  Widget _buildAnnouncementItem({required String title, required String description}) {
    return ListTile(
      leading: const Icon(Icons.announcement),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }
}

