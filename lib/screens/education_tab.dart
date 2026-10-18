import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Second tab: educational background, most recent first, with the honors
/// received at each school.
class EducationTab extends StatelessWidget {
  const EducationTab({super.key});

  // Kept in a list (newest first) so the UI code below stays short.
  // Format: (school, degree / level, years, honors received there)
  static const List<(String, String, String, List<String>)> _items = [
    (
      'La Consolacion College Tanauan',
      'Bachelor of Science in Information Technology',
      '2024 - Present',
      [
        'Dean\'s Lister (2025)',
        'Champion, Graphic Design Contest (2024)',
        '2nd Runner-Up, Organizational Performance (2024)',
      ],
    ),
    (
      'National Teachers College',
      'Bachelor of Science in Accountancy',
      '2023 - 2024',
      <String>[],
    ),
    (
      'Immaculate Heart of Mary College Inc.',
      'Senior High School - Science, Technology, Engineering and '
          'Mathematics (STEM)',
      '2021 - 2023',
      [
        'Academic Awardee',
        'Leadership Awardee',
        'Best in Work Immersion (2023)',
        'Research Excellence Awardee (2023)',
      ],
    ),
    (
      'San Juan City Integrated High School',
      'High School',
      '2016 - 2021',
      ['Academic Awardee'],
    ),
    (
      'San Juan City Integrated School',
      'Elementary',
      '2010 - 2016',
      ['Academic Awardee', 'Champion, Poster Making Contest (2013)'],
    ),
  ];

  /// Small honor badges shown under a school; wraps on narrow screens.
  Widget _honors(BuildContext context, List<String> honors) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          for (final honor in honors)
            Chip(
              avatar: Icon(
                Icons.emoji_events,
                size: 16,
                color: scheme.onPrimaryContainer,
              ),
              label: Text(
                honor,
                style: TextStyle(
                  fontSize: 12,
                  color: scheme.onPrimaryContainer,
                ),
              ),
              visualDensity: VisualDensity.compact,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        for (final (school, degree, years, honors) in _items)
          Card(
            child: ListTile(
              leading: const Icon(Icons.school),
              title: Text(school),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$degree\n$years'),
                  if (honors.isNotEmpty) _honors(context, honors),
                ],
              ),
              isThreeLine: true,
            ),
          ),
      ],
    );
  }
}
