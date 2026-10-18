/// Filter groups shown as chips in the Skills tab.
enum CertCategory {
  networking('Networking'),
  web('Web'),
  webinars('Webinars & Seminars');

  const CertCategory(this.label);

  /// Text shown on the filter chip.
  final String label;
}

/// One certificate: what it is, who issued it, and its image.
class Certificate {
  const Certificate({
    required this.title,
    required this.details,
    required this.image,
    required this.category,
  });

  final String title;

  /// Issuer / venue and date, shown under the title.
  final String details;

  /// Asset path of the certificate picture.
  final String image;

  final CertCategory category;
}

/// Cisco Networking Academy certificates, newest first.
const List<Certificate> ciscoCertificates = [
  Certificate(
    title: 'JavaScript Essentials 1',
    details:
        'Cisco Networking Academy with OpenEDG JavaScript Institute\n'
        'September 28, 2026',
    image: 'assets/images/cert_js_essentials_1.jpg',
    category: CertCategory.web,
  ),
  Certificate(
    title: 'HTML Essentials',
    details:
        'Cisco Networking Academy with JS Institute\n'
        'August 11, 2026',
    image: 'assets/images/cert_html_essentials.jpg',
    category: CertCategory.web,
  ),
  Certificate(
    title: 'Network Technician Career Path',
    details: 'Cisco Networking Academy\nApril 22, 2026',
    image: 'assets/images/cert_network_technician.jpg',
    category: CertCategory.networking,
  ),
  Certificate(
    title: 'Network Support and Security',
    details: 'Cisco Networking Academy\nApril 20, 2026',
    image: 'assets/images/cert_network_support_security.jpg',
    category: CertCategory.networking,
  ),
  Certificate(
    title: 'Network Addressing and Basic Troubleshooting',
    details: 'Cisco Networking Academy\nApril 20, 2026',
    image: 'assets/images/cert_network_addressing.jpg',
    category: CertCategory.networking,
  ),
  Certificate(
    title: 'Networking Devices and Basic Configuration',
    details: 'Cisco Networking Academy\nApril 8, 2026',
    image: 'assets/images/cert_networking_devices.jpg',
    category: CertCategory.networking,
  ),
  Certificate(
    title: 'Networking Basics',
    details: 'Cisco Networking Academy\nApril 7, 2026',
    image: 'assets/images/cert_networking_basics.jpg',
    category: CertCategory.networking,
  ),
];

/// MVConsultancy webinars and other seminars, shown in one card.
const List<Certificate> webinarCertificates = [
  Certificate(
    title: 'Cloud Tools for Productivity',
    details: 'Manila, Phils.\nOctober 14, 2026',
    image: 'assets/images/cert_webinar_2.jpg',
    category: CertCategory.webinars,
  ),
  Certificate(
    title: 'Data Analytics for Better Decisions',
    details: 'Manila, Phils.\nOctober 15, 2026',
    image: 'assets/images/cert_webinar_3.jpg',
    category: CertCategory.webinars,
  ),
  Certificate(
    title: 'Cybersecurity Awareness in a Digital World',
    details: 'Manila, Phils.\nOctober 16, 2026',
    image: 'assets/images/cert_webinar_4.jpg',
    category: CertCategory.webinars,
  ),
  Certificate(
    title: 'Social Media Marketing That Works',
    details: 'Manila, Phils.\nOctober 17, 2026',
    image: 'assets/images/cert_webinar_5.jpg',
    category: CertCategory.webinars,
  ),
  Certificate(
    title: 'Digital Career Opportunities & Freelancing',
    details: 'Manila, Phils.\nOctober 18, 2026',
    image: 'assets/images/cert_webinar_6.jpg',
    category: CertCategory.webinars,
  ),
  Certificate(
    title: 'BSIT Educational Exposure Trip during IT Week 2026',
    details: 'Bonifacio Global City, Metro Manila\nMarch 23, 2026',
    image: 'assets/images/cert_exposure_trip.jpg',
    category: CertCategory.webinars,
  ),
  Certificate(
    title: 'Bridging Business and Technology for the Next Generation',
    details: 'La Consolacion College Tanauan\nMarch 21, 2026',
    image: 'assets/images/cert_bridging_business_tech.jpg',
    category: CertCategory.webinars,
  ),
  Certificate(
    title: 'Batangas Information Technology Conference (BITCON) 2025',
    details:
        'Lipa Academy for Sports, Culture and Arts Convention Center, '
        'Dagatan, Lipa City\nApril 26, 2025',
    image: 'assets/images/cert_bitcon_2025.jpg',
    category: CertCategory.webinars,
  ),
];
