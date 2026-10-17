import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Second tab: educational background, most recent first.
class EducationTab extends StatelessWidget {
  const EducationTab({super.key});

  // TODO: Replace the school names, strand, and years with your real ones.
  // Kept in a list (newest first) so the UI code below stays short.
  // Format: (school, degree, years)
  static const List<(String, String, String)> _items = [
    (
      'La Consolacion College Tanauan',
      'Bachelor of Science in Information Technology',
      '2023 - Present'
    ),
    (
      'Your Senior High School',
      'Senior High School (Your Strand)',
      '2021 - 2023'
    ),
    ('Your Junior High School', 'Junior High School', '2017 - 2021'),
    ('Your Elementary School', 'Elementary', '2011 - 2017'),
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