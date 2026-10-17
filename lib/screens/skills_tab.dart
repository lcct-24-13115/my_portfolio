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

  // Format: (seminar / training, venue, date)
  static const List<(String, String, String)> _training = [
    (
      'Data Analytics for Better Decisions',
      'Manila, Phils.',
      'October 15, 2026'
    ),
    (
      'Cloud Tools for Productivity',
      'Manila, Phils.',
      'October 14, 2026'
    ),
    (
      'Financial Technology and AI Industry Seminar',
      'TP ICAP, Bonifacio Global City, Taguig',
      'March 23, 2026'
    ),
    (
      'Machine Learning and Software Development Seminar',
      'La Consolacion College Tanauan',
      'March 18-19, 2026'
    ),
    (
      '2-Day Technical Training: Robotics / Programming / Hackathon',
      'La Consolacion College Tanauan',
      'March 18-19, 2026'
    ),
    (
      'Batangas Information Technology Conference (BITCON)',
      'Lipa City, Batangas',
      'April 25, 2025'
    ),
    (
      'Intel Seminar: Navigating the AI Frontier',
      'La Consolacion College Tanauan',
      'March 25, 2025'
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

  /// Builds the card listing seminars and trainings attended.
  Widget _trainingSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Certifications & Training',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            for (final (title, venue, date) in _training)
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: Text(title),
                subtitle: Text('$venue\n$date'),
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
        _trainingSection(context),
      ],
    );
  }
}
