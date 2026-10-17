import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Second tab: educational background, most recent first.
class EducationTab extends StatelessWidget {
  const EducationTab({super.key});

  // Kept in a list (newest first) so the UI code below stays short.
  // Format: (school, degree / level, years)
  static const List<(String, String, String)> _items = [
    (
      'La Consolacion College Tanauan',
      'Bachelor of Science in Information Technology',
      '2024 - Present',
    ),
    (
      'National Teachers College',
      'Bachelor of Science in Accountancy',
      '2023 - 2024',
    ),
    (
      'Immaculate Heart of Mary College Inc.',
      'Senior High School - Science, Technology, Engineering and '
          'Mathematics (STEM)',
      '2021 - 2023',
    ),
    ('San Juan City Integrated High School', 'High School', '2016 - 2021'),
    ('San Juan City Integrated School', 'Elementary', '2010 - 2016'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        for (final (school, degree, years) in _items)
          Card(
            child: ListTile(
              leading: const Icon(Icons.school),
              title: Text(school),
              subtitle: Text('$degree\n$years'),
              isThreeLine: true,
            ),
          ),
      ],
    );
  }
}
