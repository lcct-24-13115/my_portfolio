import 'package:flutter/material.dart';

import '../data/certificates.dart';
import '../widgets/content_list.dart';
import '../widgets/image_gallery.dart';

/// Third tab: skills, then certifications & training.
///
/// Layout order: Technical skills, non-technical skills, then the
/// "Certifications & Training" section (Cisco certificates on top,
/// webinars and seminars right below). Filter chips narrow the list, and
/// tapping a certificate opens a swipeable gallery.
class SkillsTab extends StatefulWidget {
  const SkillsTab({super.key});

  @override
  State<SkillsTab> createState() => _SkillsTabState();
}

class _SkillsTabState extends State<SkillsTab> {
  /// Selected filter chip. Null means "All".
  CertCategory? _filter;

  static const List<String> _technical = [
    'Python',
    'Java',
    'C',
    'C++',
    'HTML',
    'CSS',
    'JavaScript',
    'Flutter & Dart',
    'Version Control (Git)',
    'Computer Networking',
    'IPv4 / IPv6 Addressing',
    'Cisco IOS',
    'Network Troubleshooting',
    'OS Installation',
    'Computer Maintenance & Troubleshooting',
  ];

  static const List<String> _nonTechnical = [
    'Leadership',
    'Research',
    'Graphic Design',
    'Poster Making',
    'Sports Journalism',
    'Problem Solving',
  ];

  /// Builds one titled card whose items are shown as chips.
  Widget _chipSection(BuildContext context, String title, List<String> items) {
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

  /// Big heading that introduces the "Certifications & Training" section.
  Widget _sectionHeading(BuildContext context, String text) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
      child: Row(
        children: [
          Icon(
            Icons.workspace_premium,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: textTheme.headlineSmall)),
        ],
      ),
    );
  }

  /// Chips that filter the certificates by category.
  Widget _filterChips() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ChoiceChip(
            label: const Text('All'),
            selected: _filter == null,
            onSelected: (_) => setState(() => _filter = null),
          ),
          for (final category in CertCategory.values)
            ChoiceChip(
              label: Text(category.label),
              selected: _filter == category,
              onSelected: (_) => setState(() => _filter = category),
            ),
        ],
      ),
    );
  }

  /// Builds a card of certificate rows. Each row shows a thumbnail;
  /// tapping it opens the gallery at that certificate.
  ///
  /// [items] are the certificates this card shows. [gallery] is the full
  /// list the viewer can swipe through, and [offset] is where [items]
  /// start inside [gallery].
  Widget _certificateCard(
    BuildContext context, {
    required String title,
    String? subtitle,
    required List<Certificate> items,
    required List<Certificate> gallery,
    required int offset,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textTheme.titleLarge),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(subtitle, style: textTheme.bodyMedium),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 4),
            for (var i = 0; i < items.length; i++)
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    items[i].image,
                    width: 80,
                    height: 56,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(
                          width: 80,
                          height: 56,
                          child: Icon(Icons.verified),
                        ),
                  ),
                ),
                title: Text(items[i].title),
                subtitle: Text(items[i].details),
                isThreeLine: true,
                trailing: const Icon(Icons.zoom_in),
                onTap: () => showImageGallery(
                  context,
                  images: [
                    for (final c in gallery)
                      GalleryImage(title: c.title, image: c.image),
                  ],
                  startIndex: offset + i,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool matches(Certificate c) => _filter == null || c.category == _filter;
    final cisco = ciscoCertificates.where(matches).toList();
    final webinars = webinarCertificates.where(matches).toList();
    // Swipe order in the viewer follows the order on screen.
    final gallery = [...cisco, ...webinars];

    return ContentList(
      children: [
        _chipSection(context, 'Technical Skills', _technical),
        _chipSection(context, 'Non-Technical Skills', _nonTechnical),
        _sectionHeading(context, 'Certifications & Training'),
        _filterChips(),
        // 1) Cisco certifications (top).
        if (cisco.isNotEmpty)
          _certificateCard(
            context,
            title: 'Cisco Certifications',
            subtitle: 'Cisco Networking Academy',
            items: cisco,
            gallery: gallery,
            offset: 0,
          ),
        // 2) Webinars and seminars, right below Cisco.
        if (webinars.isNotEmpty)
          _certificateCard(
            context,
            title: 'Webinars & Training',
            items: webinars,
            gallery: gallery,
            offset: cisco.length,
          ),
      ],
    );
  }
}
