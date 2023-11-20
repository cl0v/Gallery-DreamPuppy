import 'canil_contact.dart';

class CanilDetails {
  const CanilDetails({
    required this.name,
    required this.contacts,
    required this.address
  });

  final String name;
  final String address;
  final List<CanilContactInfo> contacts;
}
