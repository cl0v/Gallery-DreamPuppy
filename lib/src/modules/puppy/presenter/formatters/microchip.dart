abstract class MicrochipFormatter {
  static String call(bool? isMicrochipped) {
    if(isMicrochipped == null) return 'Filhote entregue com microchip de segurança aplicado';
    return isMicrochipped ? 'incluso' : 'Não incluso';
  }
}
