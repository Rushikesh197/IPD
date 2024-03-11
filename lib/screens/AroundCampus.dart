import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AroundCampus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Around Campus'),
      ),
      body: ListView(
        children: [
          _buildSection(
            title: 'Stationary',
            items: [
              _buildItem(
                name: 'Anita Stationery & Xerox',
                address: 'Gulmohar Cross Road No.1, Near Cooper Hospital, Vile Parle West, Mumbai, Maharashtra 400056',
                mapsLink: 'https://maps.app.goo.gl/wLggcZJkb9WcQ4GK6',
              ),
              _buildItem(
                name: '3rd Floor Bio Medical Engineering Department',
                address: 'No. U, 15, Bhaktivedanta Swami Rd, opp. Cooper Hospital, Navpada, JVPD Scheme, Vile Parle, Mumbai, Maharashtra 400056',
                mapsLink: 'https://maps.app.goo.gl/1qnSFsEaesMwbYMh9',
              ),
              // Add more stationary stores as needed
            ],
          ),
          _buildSection(
            title: 'Food',
            items: [
              _buildItem(
                name: 'Amar Juice Centre',
                address: '3, Gulmohar Rd, beside Cooper Hospital, JVPD Scheme, Vile Parle West, Mumbai, Maharashtra 400056',
                mapsLink: 'https://maps.app.goo.gl/xAcC4J1w7x2b2kCF9',
              ),
              _buildItem(
                name: 'Anand Stall',
                address: 'Gulmohar Road No. 1, Opp. Mithibai College, Vile Parle West, Mumbai, Maharashtra 400056',
                mapsLink: 'https://maps.app.goo.gl/BvGj7tTHuqZvWVjS7',
              ),
              // Add more restaurants as needed
            ],
          ),
          _buildSection(
            title: 'Recreation',
            items: [
              _buildItem(
                name: 'Prithvi Theatre',
                address: '20, Juhu Church Rd, Janki Kutir, Juhu, Mumbai, Maharashtra 400049',
                mapsLink: 'https://maps.app.goo.gl/Ed2nRDaD7jEZ6wtd6',
              ),
              _buildItem(
                name: 'Juhu Beach',
                address: 'Juhu Tara, Juhu, Mumbai, Maharashtra 400054',
                mapsLink: 'https://maps.app.goo.gl/4qM5VunvwuWDUpZV8',
              ),
              // Add more recreational spots as needed
            ],
          ),
          // Add more sections as needed
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            // Send an email to the support email address
            _sendEmail();
          },
          child: Text(
            'Tell us about your favourite places, we\'ll definitely add them.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: items,
        ),
      ],
    );
  }

  Widget _buildItem({required String name, required String address, required String mapsLink}) {
    return ListTile(
      title: Text(name),
      subtitle: Text(address),
      onTap: () {
        // Open the Google Maps link when the tile is tapped
        _openMapsLink(mapsLink);
      },
    );
  }

  void _openMapsLink(String mapsLink) async {
    // Open the Google Maps link
    await launch(mapsLink);
  }

  void _sendEmail() async {
    // Define the email address and subject
    final String email = 'support@example.com';
    final String subject = 'Favorite Places';

    // Create the email URL
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject},
    );

    // Launch the email client
    await launch(emailUri.toString());
  }
}
