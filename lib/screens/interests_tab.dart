import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Fourth tab: professional interests, specializations, notable projects.
class InterestsTab extends StatelessWidget {
  const InterestsTab({super.key});

  // Format: (icon, title, description)
  static const List<(IconData, String, String)> _items = [
    (
      Icons.code,
      'Programming & Web Development',
      'Building programs and websites with Python, Java, C++, HTML, CSS '
          'and JavaScript.'
    ),
    (
      Icons.phone_android,
      'Mobile App Development',
      'Creating cross-platform apps with Flutter and Dart, focusing on '
          'clean design and a smooth user experience.'
    ),
    (
      Icons.psychology,
      'AI, Machine Learning & Data Analytics',
      'Attending seminars on machine learning, AI in industry, and data '
          'analytics to learn how data supports better decisions.'
    ),
    (
      Icons.science,
      'Research',
      'Research Excellence Awardee (2023). Interested in using research '
          'to solve real problems with technology.'
    ),
    (
      Icons.brush,
      'Graphic Design',
      'Champion, LCC Tanauan Graphic Design Contest (2024).'
    ),
    (
      Icons.folder_special,
      'Notable Projects',
      'Tom and Jerry game (Flutter) and this Portfolio app (Flutter).'
    ),
    (
      Icons.emoji_events,
      'Achievements',
      'Dean\'s Lister, La Consolacion College Tanauan (2025). Second '
          'Runner-Up, Organizational Performance (2024). Leadership '
          'Awardee, Immaculate Heart of Mary College (2021-2023).'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        for (final (icon, title, description) in _items)
          Card(
            child: ListTile(
              leading: Icon(icon),
              title: Text(title),
              subtitle: Text(description),
              isThreeLine: true,
            ),
          ),
      ],
    );
  }
}
