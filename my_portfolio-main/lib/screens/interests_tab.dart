import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Fourth tab: professional interests, specializations, notable projects.
class InterestsTab extends StatelessWidget {
  const InterestsTab({super.key});

  // TODO: Replace the descriptions with your own words and real projects.
  // Format: (icon, title, description)
  static const List<(IconData, String, String)> _items = [
    (
      Icons.phone_android,
      'Mobile App Development',
      'Building cross-platform apps with Flutter and Dart, focusing on '
          'clean interfaces and a smooth user experience.'
    ),
    (
      Icons.science,
      'Area of Research',
      'Describe a topic you are curious about, e.g. mobile app usability '
          'or emerging technologies.'
    ),
    (
      Icons.folder_special,
      'Notable Projects',
      'Tom and Jerry game (Flutter), My Portfolio app. Add any '
          'publications or other projects here.'
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
