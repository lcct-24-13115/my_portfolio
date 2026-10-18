import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../utils/link_launcher.dart';
import '../widgets/content_list.dart';
import '../widgets/image_gallery.dart';

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
  ];

  // Projects shown in the showcase. The screenshot is optional: a
  // placeholder is shown until the image file exists in assets/images/.
  // Set isPrivate to false once a repository is made public, and the
  // GitHub button appears automatically.
  static const List<_Project> _projects = [
    _Project(
      title: 'Tom and Jerry: Intel Byte Chase',
      description:
          'A Tom and Jerry themed maze game with INTEL (Information '
          'Technology Enthusiasts of La Consolacion) branding. Play alone '
          'against an AI on three difficulty levels, or play online in a '
          'room with a QR code or room code. Has player accounts, a '
          'leaderboard, and light/dark themes.',
      technologies: ['Flutter', 'Dart', 'Multiplayer', 'Firebase Hosting'],
      screenshot: 'assets/images/project_tom_and_jerry.png',
      githubUrl: 'https://github.com/lcct-24-13115/tom_and_jerry_new',
      liveUrl: 'https://tom-jerry-multiplayer.web.app/',
      isPrivate: true,
      gallery: [
        GalleryImage(
          title: 'Splash screen',
          image: 'assets/images/project_tj_01_splash.jpg',
        ),
        GalleryImage(
          title: 'Main menu',
          image: 'assets/images/project_tj_03_main_menu.jpg',
        ),
        GalleryImage(
          title: 'Player login',
          image: 'assets/images/project_tj_04_login.jpg',
        ),
        GalleryImage(
          title: 'Register player',
          image: 'assets/images/project_tj_05_register.jpg',
        ),
        GalleryImage(
          title: 'Select game mode',
          image: 'assets/images/project_tj_06_game_mode.jpg',
        ),
        GalleryImage(
          title: 'Choose your character',
          image: 'assets/images/project_tj_07_character.jpg',
        ),
        GalleryImage(
          title: 'Select difficulty',
          image: 'assets/images/project_tj_08_difficulty.jpg',
        ),
        GalleryImage(
          title: 'Multiplayer lobby',
          image: 'assets/images/project_tj_09_multiplayer.jpg',
        ),
      ],
    ),
    _Project(
      title: 'Maintenance Ticketing System',
      description:
          'A web system for the school Maintenance Office. Staff file '
          'requests for materials or equipment, and each ticket moves '
          'through role-based approvals up to the school president.',
      technologies: ['Laravel', 'PHP', 'MySQL', 'Blade'],
      screenshot: 'assets/images/project_school_maintenance.png',
      githubUrl: 'https://github.com/lcct-24-13115/school-maintenance-system',
      isPrivate: true,
    ),
    _Project(
      title: 'Integrated Library Management System',
      description:
          'A library system for book loans and returns, patron profiles, '
          'reservations, attendance logging, and borrowing history reports.',
      technologies: ['Laravel', 'PHP', 'Blade', 'Tailwind CSS'],
      screenshot: 'assets/images/project_library_system.png',
      githubUrl: 'https://github.com/lcct-24-13115/library-system',
    ),
    _Project(
      title: 'My Portfolio App',
      description:
          'This app: a five-tab portfolio with a light/dark theme, '
          'certificate gallery, and automatic deployment to GitHub Pages.',
      technologies: ['Flutter', 'Dart', 'Material 3', 'GitHub Actions'],
      screenshot: 'assets/images/project_portfolio.png',
      githubUrl: 'https://github.com/lcct-24-13115/my_portfolio',
      liveUrl: 'https://lcct-24-13115.github.io/my_portfolio/',
      isPrivate: true,
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

  /// Heading shown above the projects.
  Widget _projectsHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
      child: Row(
        children: [
          Icon(
            Icons.folder_special,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Projects',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }

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
    return ContentList(
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
        _projectsHeading(context),
        for (final project in _projects) _ProjectCard(project: project),
        _awardsCard(context),
      ],
    );
  }
}

/// Details of one project shown in the showcase.
class _Project {
  const _Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.screenshot,
    required this.githubUrl,
    this.liveUrl,
    this.isPrivate = false,
    this.gallery = const [],
  });

  final String title;
  final String description;
  final List<String> technologies;

  /// Asset path of the screenshot.
  final String screenshot;
  final String githubUrl;

  /// Optional link to the running app.
  final String? liveUrl;

  /// Private repositories cannot be opened by visitors, so a "Private
  /// repository" label is shown instead of a GitHub button.
  final bool isPrivate;

  /// Extra screenshots. When not empty, the first one replaces the banner
  /// and tapping the card picture opens a swipeable gallery.
  final List<GalleryImage> gallery;
}

/// Card with a screenshot, description, technology chips, and link buttons.
class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final _Project project;

  /// Shown when the screenshot file is not in the assets yet.
  Widget _placeholder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppTheme.headerGradient,
        ),
      ),
      child: const Center(
        child: Icon(Icons.image_outlined, size: 48, color: Colors.white70),
      ),
    );
  }

  /// Picture at the top of the card. With screenshots it is tappable and
  /// shows how many pictures the gallery has.
  Widget _cover(BuildContext context) {
    final shots = project.gallery;
    final picture = AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.asset(
        shots.isEmpty ? project.screenshot : shots.first.image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      ),
    );
    if (shots.isEmpty) return picture;

    return InkWell(
      onTap: () => showImageGallery(context, images: shots, startIndex: 0),
      child: Stack(
        children: [
          picture,
          Positioned(
            right: 12,
            bottom: 12,
            child: Chip(
              avatar: const Icon(Icons.photo_library_outlined, size: 16),
              label: Text('${shots.length} screenshots'),
              visualDensity: VisualDensity.compact,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final liveUrl = project.liveUrl;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cover(context),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.title, style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(project.description, style: textTheme.bodyMedium),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final tech in project.technologies)
                      Chip(
                        label: Text(tech),
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (project.isPrivate)
                      const Chip(
                        avatar: Icon(Icons.lock_outline, size: 16),
                        label: Text('Private repository'),
                        visualDensity: VisualDensity.compact,
                      )
                    else
                      FilledButton.icon(
                        onPressed: () => openLink(
                          context,
                          label: 'GitHub',
                          shown: project.githubUrl,
                          link: project.githubUrl,
                        ),
                        icon: const Icon(Icons.code, size: 18),
                        label: const Text('GitHub'),
                      ),
                    if (liveUrl != null)
                      OutlinedButton.icon(
                        onPressed: () => openLink(
                          context,
                          label: 'Live demo',
                          shown: liveUrl,
                          link: liveUrl,
                        ),
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: const Text('Live demo'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
