import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/contact_data.dart';
import '../data/references_data.dart';
import '../utils/link_launcher.dart';
import '../widgets/content_list.dart';

/// Fifth tab: multiple ways to contact me, then my professional references.
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

  /// Heading shown above the references.
  Widget _referencesHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
      child: Row(
        children: [
          Icon(Icons.groups, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'References',
              style: Theme.of(context).textTheme.headlineSmall,
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
        for (final (icon, label, shown, link) in contactItems)
          Card(
            child: ListTile(
              leading: icon,
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
        _referencesHeading(context),
        for (final reference in references)
          _ReferenceCard(
            reference: reference,
            onCopy: (label, value) => _copy(context, label, value),
          ),
      ],
    );
  }
}

/// Card for one reference with a tappable phone number and email.
class _ReferenceCard extends StatelessWidget {
  const _ReferenceCard({required this.reference, required this.onCopy});

  final Reference reference;

  /// Copies [value] to the clipboard. [label] is used in the confirmation.
  final void Function(String label, String value) onCopy;

  /// One tappable row: opens [link] on tap, copies [value] with the button.
  Widget _row(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required String link,
  }) {
    return ListTile(
      dense: true,
      leading: Icon(icon),
      title: Text(value),
      trailing: IconButton(
        icon: const Icon(Icons.copy, size: 18),
        tooltip: 'Copy',
        onPressed: () => onCopy(label, value),
      ),
      onTap: () => openLink(context, label: label, shown: value, link: link),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reference.name, style: textTheme.titleMedium),
                  Text(reference.position, style: textTheme.bodyMedium),
                ],
              ),
            ),
            const SizedBox(height: 4),
            _row(
              context,
              icon: Icons.phone,
              label: 'Phone',
              value: reference.phone,
              link: reference.phoneLink,
            ),
            _row(
              context,
              icon: Icons.email,
              label: 'Email',
              value: reference.email,
              link: reference.emailLink,
            ),
          ],
        ),
      ),
    );
  }
}
