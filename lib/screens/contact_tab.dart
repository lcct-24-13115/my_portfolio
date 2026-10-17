import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';

/// Fifth tab: multiple ways to contact me.
///
/// Tapping a row copies its value to the clipboard.
class ContactTab extends StatelessWidget {
  const ContactTab({super.key});

  // Format: (icon, label, value)
  static const List<(IconData, String, String)> _items = [
    (Icons.email, 'Email', 'cassandraalemania@gmail.com'),
    (Icons.phone, 'Phone', '0956-297-3655'),
    (Icons.facebook, 'Facebook', 'facebook.com/JCUA24'),
    (
      Icons.business_center,
      'LinkedIn',
      'linkedin.com/in/julia-cassandra-alemania-911831444',
    ),
    (Icons.link, 'GitHub', 'github.com/lcct-24-13115'),
    (Icons.location_on, 'Location', 'Tanauan City, Batangas'),
  ];

  /// Copies [value] to the clipboard and confirms with a SnackBar.
  Future<void> _copy(BuildContext context, String label, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$label copied to clipboard')));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppTheme.pagePadding,
      children: [
        for (final (icon, label, value) in _items)
          Card(
            child: ListTile(
              leading: Icon(icon),
              title: Text(label),
              subtitle: Text(value),
              trailing: const Icon(Icons.copy, size: 18),
              onTap: () => _copy(context, label, value),
            ),
          ),
      ],
    );
  }
}
