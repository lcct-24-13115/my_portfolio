import 'package:flutter/material.dart';

import '../app_theme.dart';

/// First tab: photo, name, age, and a short bio.
class PersonalInfoTab extends StatelessWidget {
  const PersonalInfoTab({super.key});

  // TODO: Replace these with your real details.
  static const String _name = 'Julia Cassandra Alemania';
  static const String _age = '21';
  static const String _course = 'BSIT - 3rd Year';
  static const String _bio =
      'I am a third-year BS Information Technology student at La Consolacion '
      'College Tanauan. I enjoy building mobile apps with Flutter and I want '
      'to grow into a developer who creates useful, well-designed software.';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        const SizedBox(height: 8),
        Center(
          child: CircleAvatar(
            radius: 72,
            backgroundColor: scheme.primaryContainer,
            // ClipOval + errorBuilder: shows an icon if the photo is missing
            // instead of crashing the screen.
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                width: 144,
                height: 144,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.person,
                  size: 72,
                  color: scheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(_name,
            textAlign: TextAlign.center, style: textTheme.headlineMedium),
        const SizedBox(height: 4),
        Text('Age: $_age  |  $_course',
            textAlign: TextAlign.center, style: textTheme.titleMedium),
        const SizedBox(height: 20),
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
