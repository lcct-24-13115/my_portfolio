import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Fourth tab: professional interests, specializations, notable projects,
/// and the awards received.
class InterestsTab extends StatelessWidget {
  const InterestsTab({super.key});

  // Format: (icon, title, description)
  static const List<(IconData, String, String)> _items = [
    (
      Icons.code,
      'Programming & Web Development',
      'Building programs and websites with Python, Java, C++, HTML, CSS '
          'and JavaScript.',
    ),
    (
      Icons.router,
      'Networking & IT Support',
      'Completed the Cisco Network Technician Career Path: IP addressing, '
          'Cisco IOS configuration, troubleshooting, and network security.',
    ),
    (
      Icons.phone_android,
      'Mobile App Development',
      'Creating cross-platform apps with Flutter and Dart, focusing on '
          'clean design and a smooth user experience.',
    ),
    (
      Icons.psychology,
      'Data Analytics & Emerging Technologies',
      'Attending webinars and seminars on data analytics, cybersecurity, '
          'and cloud tools to learn how technology supports better '
          'decisions.',
    ),
    (
      Icons.science,
      'Research',
      'Research Excellence Awardee (2023). Interested in using research '
          'to solve real problems with technology.',
    ),
    (
      Icons.brush,
      'Graphic Design',
      'Champion, LCC Tanauan Graphic Design Contest (2024).',
    ),
    (
      Icons.folder_special,
      'Notable Projects',
      'Tom and Jerry game (Flutter) and this Portfolio app (Flutter).',
    ),
  ];

  // Format: (award, school / organizer, year)
  // Newest first.
  static const List<(String, String, String)> _awards = [
    ('Dean\'s Lister Recipient', 'La Consolacion College Tanauan', '2025'),
    (
      'Champion in LCCTanauan Graphic Design Contest',
      'La Consolacion College Tanauan',
      '2024',
    ),
    (
      'Second Runner-Up in Organizational Performance (Group Competition)',
      'La Consolacion College Tanauan',
      '2024',
    ),
    ('Best in Work Immersion', 'Immaculate Heart of Mary College Inc.', '2023'),
    (
      'Research Excellence Awardee',
      'Immaculate Heart of Mary College Inc.',
      '2023',
    ),
    (
      'Leadership Awardee',
      'Immaculate Heart of Mary College Inc.',
      '2021 - 2023',
    ),
    (
      'Academic Awardee',
      'Immaculate Heart of Mary College Inc.',
      '2021 - 2023',
    ),
    (
      'Second Place in Sports Journalism',
      'Elementary Schools Division of San Juan City, Metro Manila',
      '2020',
    ),
    ('Academic Awardee', 'San Juan City Integrated High School', '2016 - 2021'),
    (
      'Champion in Poster Making Contest',
      'San Juan City Integrated School',
      '2013',
    ),
    ('Academic Awardee', 'San Juan City Integrated School', '2010 - 2016'),
  ];

  /// Card listing every award with its school and year.
  Widget _awardsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Awards & Recognitions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            for (final (award, from, year) in _awards)
              ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(award),
                subtitle: Text('$from\n$year'),
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
        for (final (icon, title, description) in _items)
          Card(
            child: ListTile(
              leading: Icon(icon),
              title: Text(title),
              subtitle: Text(description),
              isThreeLine: true,
            ),
          ),
        _awardsCard(context),
      ],
    );
  }
}
