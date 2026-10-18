import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Third tab: skills, then certifications & training.
///
/// Layout order: Technical skills, non-technical skills, then the
/// "Certifications & Training" section (Cisco certificates on top,
/// the MVConsultancy webinar series right below, other seminars last).
class SkillsTab extends StatelessWidget {
  const SkillsTab({super.key});

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

  // Format: (certificate, issuer, date issued, image file)
  // Cisco Networking Academy certificates, newest first.
  static const List<(String, String, String, String)> _certifications = [
    (
      'JavaScript Essentials 1',
      'Cisco Networking Academy with OpenEDG JavaScript Institute',
      'September 28, 2026',
      'assets/images/cert_js_essentials_1.jpg'
    ),
    (
      'HTML Essentials',
      'Cisco Networking Academy with JS Institute',
      'August 11, 2026',
      'assets/images/cert_html_essentials.jpg'
    ),
    (
      'Network Technician Career Path',
      'Cisco Networking Academy',
      'April 22, 2026',
      'assets/images/cert_network_technician.jpg'
    ),
    (
      'Network Support and Security',
      'Cisco Networking Academy',
      'April 20, 2026',
      'assets/images/cert_network_support_security.jpg'
    ),
    (
      'Network Addressing and Basic Troubleshooting',
      'Cisco Networking Academy',
      'April 20, 2026',
      'assets/images/cert_network_addressing.jpg'
    ),
    (
      'Networking Devices and Basic Configuration',
      'Cisco Networking Academy',
      'April 8, 2026',
      'assets/images/cert_networking_devices.jpg'
    ),
    (
      'Networking Basics',
      'Cisco Networking Academy',
      'April 7, 2026',
      'assets/images/cert_networking_basics.jpg'
    ),
  ];

  // Format: (webinar number, title, tagline, date, image file)
  // MVConsultancy - IT & Digital Skills Webinar Series 6.
  static const List<(int, String, String, String, String)> _webinars = [
    (
      2,
      'Cloud Tools for Productivity',
      'Work Smarter. Collaborate Anywhere.',
      'October 14, 2026',
      'assets/images/cert_webinar_2.jpg'
    ),
    (
      3,
      'Data Analytics for Better Decisions',
      'From Data to Insights to Action.',
      'October 15, 2026',
      'assets/images/cert_webinar_3.jpg'
    ),
    (
      4,
      'Cybersecurity Awareness in a Digital World',
      'Protect Yourself. Protect Your Business.',
      'October 16, 2026',
      'assets/images/cert_webinar_4.jpg'
    ),
    (
      5,
      'Social Media Marketing That Works',
      'Create. Engage. Convert.',
      'October 17, 2026',
      'assets/images/cert_webinar_5.jpg'
    ),
    (
      6,
      'Digital Career Opportunities & Freelancing',
      'New Skills. Global Opportunities.',
      'October 18, 2026',
      'assets/images/cert_webinar_6.jpg'
    ),
  ];

  // Format: (seminar / training, venue, date)
  static const List<(String, String, String)> _training = [
    (
      'Financial Technology and AI Industry Seminar',
      'TP ICAP, Bonifacio Global City, Taguig',
      'March 23, 2026'
    ),
    (
      'Machine Learning and Software Development Seminar',
      'La Consolacion College Tanauan',
      'March 18-19, 2026'
    ),
    (
      '2-Day Technical Training: Robotics / Programming / Hackathon',
      'La Consolacion College Tanauan',
      'March 18-19, 2026'
    ),
    (
      'Batangas Information Technology Conference (BITCON)',
      'Lipa City, Batangas',
      'April 25, 2025'
    ),
    (
      'Intel Seminar: Navigating the AI Frontier',
      'La Consolacion College Tanauan',
      'March 25, 2025'
    ),
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
          Icon(Icons.workspace_premium,
              color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: textTheme.headlineSmall)),
        ],
      ),
    );
  }

  /// Opens the full certificate in a dialog. Pinch or scroll to zoom.
  void _openCertificate(BuildContext context, String title, String imagePath) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => Dialog(
        insetPadding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(title),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(dialogContext).pop(),
              ),
            ),
            Flexible(
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text('Certificate image not found.'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a card of certificate rows. Each row shows a thumbnail;
  /// tapping it opens the full image.
  ///
  /// [rows] format: (title, details shown under the title, image file).
  Widget _certificateCard(
    BuildContext context, {
    required String title,
    String? subtitle,
    required List<(String, String, String)> rows,
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
            for (final (name, details, image) in rows)
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    image,
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
                title: Text(name),
                subtitle: Text(details),
                isThreeLine: true,
                trailing: const Icon(Icons.zoom_in),
                onTap: () => _openCertificate(context, name, image),
              ),
          ],
        ),
      ),
    );
  }

  /// Builds a plain card with a title and (title, venue, date) rows.
  Widget _listSection(BuildContext context, String title, IconData icon,
      List<(String, String, String)> rows) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
            ),
            for (final (name, detail, date) in rows)
              ListTile(
                leading: Icon(icon),
                title: Text(name),
                subtitle: Text('$detail\n$date'),
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
        _chipSection(context, 'Technical Skills', _technical),
        _chipSection(context, 'Non-Technical Skills', _nonTechnical),
        _sectionHeading(context, 'Certifications & Training'),
        // 1) Cisco certifications with their certificate images (top).
        _certificateCard(
          context,
          title: 'Cisco Certifications',
          subtitle: 'Cisco Networking Academy',
          rows: [
            for (final (name, issuer, date, image) in _certifications)
              (name, '$issuer\n$date', image),
          ],
        ),
        // 2) Webinar series, right below the Cisco certifications.
        _certificateCard(
          context,
          title: 'IT & Digital Skills Webinar Series 6',
          subtitle: 'MVConsultancy  |  Google Meet  |  Oct 13-18, 2026',
          rows: [
            for (final (number, name, tagline, date, image) in _webinars)
              ('Webinar #$number: $name', '$tagline\n$date', image),
          ],
        ),
        // 3) Other seminars and trainings.
        _listSection(context, 'Other Seminars & Training',
            Icons.school, _training),
      ],
    );
  }
}
