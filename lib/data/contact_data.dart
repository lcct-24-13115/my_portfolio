import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Contact details shared by the Personal and Contact tabs, so they are
/// written (and updated) in one place only.
///
/// Social media rows use the official brand icons from Font Awesome;
/// the others use Material icons. Icons are stored as widgets because
/// Font Awesome icons are drawn with [FaIcon], not [Icon].
///
/// Format: (icon widget, label, text shown, link opened on tap)
const List<(Widget, String, String, String)> contactItems = [
  (
    Icon(Icons.email),
    'Email',
    'cassandraalemania@gmail.com',
    'mailto:cassandraalemania@gmail.com',
  ),
  (Icon(Icons.phone), 'Phone', '0956-297-3655', 'tel:+639562973655'),
  (
    FaIcon(FontAwesomeIcons.facebook),
    'Facebook',
    'facebook.com/JCUA24',
    'https://www.facebook.com/JCUA24',
  ),
  (
    FaIcon(FontAwesomeIcons.instagram),
    'Instagram',
    'instagram.com/makethoiu_',
    'https://www.instagram.com/makethoiu_',
  ),
  (
    FaIcon(FontAwesomeIcons.tiktok),
    'TikTok',
    'tiktok.com/@liaxdcute',
    'https://www.tiktok.com/@liaxdcute',
  ),
  (
    FaIcon(FontAwesomeIcons.linkedin),
    'LinkedIn',
    'linkedin.com/in/julia-cassandra-alemania-911831444',
    'https://www.linkedin.com/in/julia-cassandra-alemania-911831444',
  ),
  (
    FaIcon(FontAwesomeIcons.github),
    'GitHub',
    'github.com/lcct-24-13115',
    'https://github.com/lcct-24-13115',
  ),
  (
    Icon(Icons.location_on),
    'Address',
    'Blk 25 Lot 12 Phase 1, Tanauan Park Place, Bagumbayan, '
        'Tanauan City, Batangas 4232',
    // Opens Google Maps with the address already searched.
    'https://www.google.com/maps/search/?api=1&query='
        'Blk%2025%20Lot%2012%20Phase%201%2C%20Tanauan%20Park%20Place%2C'
        '%20Bagumbayan%2C%20Tanauan%20City%2C%20Batangas%204232',
  ),
];
