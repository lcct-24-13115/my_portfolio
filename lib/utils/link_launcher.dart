import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens [link] (web page, email, phone, or maps).
///
/// If it cannot be opened, [shown] is copied to the clipboard instead and a
/// SnackBar tells the visitor, so the information is never lost.
Future<void> openLink(
  BuildContext context, {
  required String label,
  required String shown,
  required String link,
}) async {
  // Grab the messenger before the await so the context is not used after it.
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
