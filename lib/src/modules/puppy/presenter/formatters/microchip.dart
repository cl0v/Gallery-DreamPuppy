abstract class MicrochipFormatter {
  static String call(bool? isMicrochipped) {
    if(isMicrochipped == null) return 'Informa se será entregue com microchip de identificação e segurança aplicado';
    return isMicrochipped ? 'Incluso' : 'Não incluso';
  }
}
