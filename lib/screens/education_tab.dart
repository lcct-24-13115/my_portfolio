import 'package:flutter/material.dart';

import '../widgets/content_list.dart';

/// Second tab: educational background as a vertical timeline, most recent
/// first, with the honors received at each school.
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

  /// One timeline entry: a dot and line on the left, the school card on
  /// the right. The last entry has no line below its dot.
  Widget _entry(
    BuildContext context, {
    required (String, String, String, List<String>) item,
    required bool isFirst,
    required bool isLast,
  }) {
    final (school, degree, years, honors) = item;
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                const SizedBox(height: 18),
                // The current school gets a filled dot, older ones an outline.
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFirst ? scheme.primary : scheme.surface,
                    border: Border.all(color: scheme.primary, width: 3),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 3,
                      margin: const EdgeInsets.only(top: 4),
                      color: scheme.primary.withAlpha(90),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 4),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        years,
                        style: textTheme.labelLarge?.copyWith(
                          color: scheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(school, style: textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text(degree, style: textTheme.bodyMedium),
                      if (honors.isNotEmpty) _honors(context, honors),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContentList(
      children: [
        for (var i = 0; i < _items.length; i++)
          _entry(
            context,
            item: _items[i],
            isFirst: i == 0,
            isLast: i == _items.length - 1,
          ),
      ],
    );
  }
}
