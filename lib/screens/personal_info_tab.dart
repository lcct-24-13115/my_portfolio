import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../data/contact_data.dart';
import '../utils/link_launcher.dart';

/// First tab: photo, name, age, quick links, and a short bio.
class PersonalInfoTab extends StatelessWidget {
  const PersonalInfoTab({super.key});

  static const String _name = 'Julia Cassandra U. Alemania';
  static const String _age = '21';
  static const String _course = 'BS Information Technology';
  static const String _bio =
      'I am a third-year BS Information Technology student at La Consolacion '
      'College Tanauan and a Dean\'s Lister. I enjoy programming, web and '
      'mobile app development, and solving problems with technology. I am '
      'looking for an IT internship or entry-level role where I can apply '
      'my technical skills, learn from real projects, and contribute to the '
      'success of the team.';

  static const String _objective =
      'To obtain a challenging internship or entry-level position in IT, '
      'where I can apply my technical skills in programming, systems '
      'analysis, and problem-solving, while gaining hands-on experience and '
      'contributing to the success of the organization.';

  // Format: (icon, label, value)
  static const List<(IconData, String, String)> _details = [
    (Icons.school, 'School', 'La Consolacion College Tanauan'),
    (Icons.computer, 'Course', 'BS Information Technology (3rd Year)'),
    (Icons.place, 'Birthplace', 'Quezon City, Metro Manila'),
    (Icons.church, 'Religion', 'Roman Catholic'),
  ];

  /// Labels from the shared contact data shown as quick buttons.
  static const Set<String> _quickLabels = {'Email', 'LinkedIn', 'GitHub'};

  /// Gradient header with the photo, name, course, and quick-link buttons.
  Widget _header(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppTheme.headerGradient,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // White ring around the photo.
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 68,
              backgroundColor: scheme.primaryContainer,
              // ClipOval + errorBuilder: shows an icon if the photo is
              // missing instead of crashing the screen.
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg',
                  width: 136,
                  height: 136,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.person,
                    size: 68,
                    color: scheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _name,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Age: $_age  |  $_course',
            textAlign: TextAlign.center,
            style: textTheme.titleSmall?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          // Wrap moves buttons to a new line on narrow phone screens.
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final (icon, label, shown, link) in contactItems)
                if (_quickLabels.contains(label))
                  FilledButton.tonalIcon(
                    onPressed: () => openLink(
                      context,
                      label: label,
                      shown: shown,
                      link: link,
                    ),
                    icon: IconTheme.merge(
                      data: const IconThemeData(size: 18),
                      child: icon,
                    ),
                    label: Text(label),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(40),
                      foregroundColor: Colors.white,
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }

  /// Card with a title and a paragraph of text.
  Widget _textCard(BuildContext context, String title, String text) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(text, style: textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }

  /// Card listing quick facts as (icon, label, value) rows.
  Widget _detailsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Personal Details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            for (final (icon, label, value) in _details)
              ListTile(
                leading: Icon(icon),
                title: Text(label),
                subtitle: Text(value),
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
        _header(context),
        const SizedBox(height: 16),
        _textCard(context, 'About Me', _bio),
        _textCard(context, 'Career Objective', _objective),
        _detailsCard(context),
      ],
    );
  }
}
