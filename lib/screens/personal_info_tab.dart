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
                    icon: Icon(icon, size: 18),
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

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        _header(context),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About Me', style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(_bio, style: textTheme.bodyLarge),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
