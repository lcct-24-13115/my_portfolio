/// One professional reference: who they are and how to reach them.
class Reference {
  const Reference({
    required this.name,
    required this.position,
    required this.phone,
    required this.email,
  });

  final String name;
  final String position;

  /// Mobile number as written locally, for example 09171234567.
  final String phone;
  final String email;

  /// Link that opens the phone dialer. The leading 0 becomes +63.
  String get phoneLink => 'tel:+63${phone.substring(1)}';

  /// Link that opens the email app.
  String get emailLink => 'mailto:$email';
}

/// People who can vouch for my work, shown in the Contact tab.
const List<Reference> references = [
  Reference(
    name: 'Engr. Salem M. Layio',
    position: 'Program Chair - BSIT',
    phone: '09178898876',
    email: 'salemcoe@lcctanauan.edu.ph',
  ),
  Reference(
    name: 'Dr. Alona Cabrera',
    position: 'Practicum Coordinator & Teacher',
    phone: '09205699666',
    email: 'cabrera.alona@lcctanauan.edu.ph',
  ),
  Reference(
    name: 'Mrs. Leah Lozendo',
    position: 'College Professor',
    phone: '09692099128',
    email: 'leahllozendo@gmail.com',
  ),
  Reference(
    name: 'Mr. Art Platon',
    position: 'College Professor',
    phone: '09307431059',
    email: 'p.art.cedrick01@gmail.com',
  ),
];
