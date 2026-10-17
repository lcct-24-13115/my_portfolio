import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Third tab: technical skills, non-technical skills, certifications.
class SkillsTab extends StatelessWidget {
  const SkillsTab({super.key});

  static const List<String> _technical = [
    'Python',
    'Java',
    'C',
    'C++',
    'HTML',
    'CSS',
    'JavaScript',
    'Flutter & Dart',
    'Version Control (Git)',
    'Computer Networking',
    'IPv4 / IPv6 Addressing',
    'Cisco IOS',
    'Network Troubleshooting',
    'OS Installation',
    'Computer Maintenance & Troubleshooting',
  ];

  static const List<String> _nonTechnical = [
    'Leadership',
    'Research',
    'Graphic Design',
    'Poster Making',
    'Sports Journalism',
    'Problem Solving',
  ];

  // Format: (certificate, issuer, date issued)
  // Cisco Networking Academy certificates, newest first.
  static const List<(String, String, String)> _certifications = [
    (
      'JavaScript Essentials 1',
      'Cisco Networking Academy with OpenEDG JavaScript Institute',
      'September 28, 2026',
    ),
    (
      'HTML Essentials',
      'Cisco Networking Academy with JS Institute',
      'August 11, 2026',
    ),
    (
      'Network Technician Career Path',
      'Cisco Networking Academy',
      'April 22, 2026',
    ),
    (
      'Network Support and Security',
      'Cisco Networking Academy',
      'April 20, 2026',
    ),
    (
      'Network Addressing and Basic Troubleshooting',
      'Cisco Networking Academy',
      'April 20, 2026',
    ),
    (
      'Networking Devices and Basic Configuration',
      'Cisco Networking Academy',
      'April 8, 2026',
    ),
    ('Networking Basics', 'Cisco Networking Academy', 'April 7, 2026'),
  ];

  // Format: (seminar / training, venue, date)
  static const List<(String, String, String)> _training = [
    (
      'Data Analytics for Better Decisions',
      'Manila, Phils.',
      'October 15, 2026',
    ),
    ('Cloud Tools for Productivity', 'Manila, Phils.', 'October 14, 2026'),
    (
      'Financial Technology and AI Industry Seminar',
      'TP ICAP, Bonifacio Global City, Taguig',
      'March 23, 2026',
    ),
    (
      'Machine Learning and Software Development Seminar',
      'La Consolacion College Tanauan',
      'March 18-19, 2026',
    ),
    (
      '2-Day Technical Training: Robotics / Programming / Hackathon',
      'La Consolacion College Tanauan',
      'March 18-19, 2026',
    ),
    (
      'Batangas Information Technology Conference (BITCON)',
      'Lipa City, Batangas',
      'April 25, 2025',
    ),
    (
      'Intel Seminar: Navigating the AI Frontier',
      'La Consolacion College Tanauan',
      'March 25, 2025',
    ),
  ];

  /// Builds one titled card whose items are shown as chips.
  Widget _chipSection(BuildContext context, String title, List<String> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            // Wrap places chips in rows and starts a new line when full.
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final s in items) Chip(label: Text(s))],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a card with a title and a list of (title, detail, date) rows.
  Widget _listSection(
    BuildContext context,
    String title,
    IconData icon,
    List<(String, String, String)> rows,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(title, style: Theme.of(context).textTheme.titleLarge),
            ),
            for (final (name, detail, date) in rows)
              ListTile(
                leading: Icon(icon),
                title: Text(name),
                subtitle: Text('$detail\n$date'),
                isThreeLine: true,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        _chipSection(context, 'Technical Skills', _technical),
        _chipSection(context, 'Non-Technical Skills', _nonTechnical),
        _listSection(
          context,
          'Certifications',
          Icons.verified,
          _certifications,
        ),
        _listSection(
          context,
          'Seminars & Training',
          Icons.workspace_premium,
          _training,
        ),
      ],
    );
  }
}
