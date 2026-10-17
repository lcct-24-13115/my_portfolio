import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Third tab: technical skills, non-technical skills, certifications.
class SkillsTab extends StatelessWidget {
  const SkillsTab({super.key});

  // TODO: Replace with your real skills and certificates.
  static const List<String> _technical = [
    'Flutter',
    'Dart',
    'Java',
    'SQL',
    'Git & GitHub',
  ];
  static const List<String> _nonTechnical = [
    'Teamwork',
    'Communication',
    'Time Management',
    'Problem Solving',
  ];
  static const List<String> _certifications = [
    'Add your certificate or training here',
  ];

  /// Builds one titled card whose items are shown as chips.
  Widget _section(BuildContext context, String title, List<String> items) {
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        _section(context, 'Technical Skills', _technical),
        _section(context, 'Non-Technical Skills', _nonTechnical),
        _section(context, 'Certifications & Training', _certifications),
      ],
    );
  }
}
