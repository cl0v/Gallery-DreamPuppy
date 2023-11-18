enum ContactType {
  none(''),
  whatsapp('WhatsApp'),
  instagram('Instagram'),
  phone('Telefone'),
  other('...');

  const ContactType(this.value);

  final String value;
}

class CanilContactInfo {
  // Whats, Insta, etc...
  ContactType type;
  String? contact;

  CanilContactInfo({
    required this.type,
    this.contact,
  });
}
