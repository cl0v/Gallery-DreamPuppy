import 'canil_contact.dart';

class CanilDetails {
  const CanilDetails({
    required this.name,
    required this.contacts,
  });

  final String name;
  final List<CanilContactInfo> contacts;
}
