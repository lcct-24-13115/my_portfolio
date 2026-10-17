import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_theme.dart';

/// Fifth tab: multiple ways to contact me.
///
/// Tapping a row opens the link (email app, dialer, browser, or maps).
/// The copy button on the right copies the text to the clipboard.
class ContactTab extends StatelessWidget {
  const ContactTab({super.key});

  // Format: (icon, label, text shown, link opened on tap)
  static const List<(IconData, String, String, String)> _items = [
    (
      Icons.email,
      'Email',
      'cassandraalemania@gmail.com',
      'mailto:cassandraalemania@gmail.com'
    ),
    (Icons.phone, 'Phone', '0956-297-3655', 'tel:+639562973655'),
    (
      Icons.facebook,
      'Facebook',
      'facebook.com/JCUA24',
      'https://www.facebook.com/JCUA24'
    ),
    (
      Icons.business_center,
      'LinkedIn',
      'linkedin.com/in/julia-cassandra-alemania-911831444',
      'https://www.linkedin.com/in/julia-cassandra-alemania-911831444'
    ),
    (
      Icons.link,
      'GitHub',
      'github.com/lcct-24-13115',
      'https://github.com/lcct-24-13115'
    ),
    (
      Icons.location_on,
      'Location',
      'Tanauan City, Batangas',
      'https://www.google.com/maps/search/?api=1&query=Tanauan+City+Batangas'
    ),
  ];

  /// Opens [link]. If it cannot be opened, copies [shown] to the clipboard
  /// so the visitor can still use it.
  Future<void> _open(
      BuildContext context, String label, String shown, String link) async {
    final messenger = ScaffoldMessenger.of(context);
    var opened = false;
    try {
      opened = await launchUrl(
        Uri.parse(link),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      opened = false;
    }
    if (opened) return;

    await Clipboard.setData(ClipboardData(text: shown));
    messenger.showSnackBar(
      SnackBar(content: Text('Could not open $label. Copied instead.')),
    );
  }

  /// Copies [value] to the clipboard and confirms with a SnackBar.
  Future<void> _copy(BuildContext context, String label, String value) async {
    final messenger = ScaffoldMessenger.of(context);
    await Clipboard.setData(ClipboardData(text: value));
    messenger.showSnackBar(
      SnackBar(content: Text('$label copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        for (final (icon, label, shown, link) in _items)
          Card(
            child: ListTile(
              leading: Icon(icon),
              title: Text(label),
              subtitle: Text(shown),
              trailing: IconButton(
                icon: const Icon(Icons.copy, size: 18),
                tooltip: 'Copy',
                onPressed: () => _copy(context, label, shown),
              ),
              onTap: () => _open(context, label, shown, link),
            ),
          ),
      ],
    );
  }
}