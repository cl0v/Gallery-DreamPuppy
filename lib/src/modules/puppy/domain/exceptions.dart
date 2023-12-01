class PuppyDetailsException implements Exception {
  const PuppyDetailsException({required this.messsage, required this.code});

  final String messsage;
  final int code;
}

class TalkToKennelBtnException implements Exception {
  const TalkToKennelBtnException({required this.messsage, required this.code});

  final String messsage;
  final int code;
}