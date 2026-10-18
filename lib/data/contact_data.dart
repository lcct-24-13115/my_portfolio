import 'package:flutter/material.dart';

/// Contact details shared by the Personal and Contact tabs, so they are
/// written (and updated) in one place only.
///
/// Format: (icon, label, text shown, link opened on tap)
const List<(IconData, String, String, String)> contactItems = [
  (
    Icons.email,
    'Email',
    'cassandraalemania@gmail.com',
    'mailto:cassandraalemania@gmail.com',
  ),
  (Icons.phone, 'Phone', '0956-297-3655', 'tel:+639562973655'),
  (
    Icons.facebook,
    'Facebook',
    'facebook.com/JCUA24',
    'https://www.facebook.com/JCUA24',
  ),
  (
    Icons.business_center,
    'LinkedIn',
    'linkedin.com/in/julia-cassandra-alemania-911831444',
    'https://www.linkedin.com/in/julia-cassandra-alemania-911831444',
  ),
  (
    Icons.link,
    'GitHub',
    'github.com/lcct-24-13115',
    'https://github.com/lcct-24-13115',
  ),
  (
    Icons.location_on,
    'Location',
    'Tanauan City, Batangas',
    'https://www.google.com/maps/search/?api=1&query=Tanauan+City+Batangas',
  ),
];
