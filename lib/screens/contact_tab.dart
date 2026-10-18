import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';
import '../data/contact_data.dart';
import '../utils/link_launcher.dart';

/// Fifth tab: multiple ways to contact me.
///
/// Tapping a row opens the link (email app, dialer, browser, or maps).
/// The copy button on the right copies the text to the clipboard.
class ContactTab extends StatelessWidget {
  const ContactTab({super.key});

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
        for (final (icon, label, shown, link) in contactItems)
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
              onTap: () =>
                  openLink(context, label: label, shown: shown, link: link),
            ),
          ),
      ],
    );
  }
}
