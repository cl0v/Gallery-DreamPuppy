abstract class BirthDateFormatter {
  static String call(String? dateStr) {
    if(dateStr == null) return 'Dia do nascimento';
    var date = DateTime.parse(dateStr);
    final month = date.month;
    final monthS = [
      "Jan",
      "Fev",
      "Mar",
      "Abr",
      "Mai",
      "Jun",
      "Jul",
      "Ago",
      "Set",
      "Out",
      "Nov",
      "Dez"
    ][month-1];
    final dayS = date.day.toString();
    final yearS = date.year.toString().substring(2, 4);
    // final hourS = _put0OnTime(date.hour.toString());
    // final minuteS = _put0OnTime(date.minute.toString());

    // String time = hourS == '00' && minuteS == '00' ? '' : ' às $hourS:$minuteS';
    return '$dayS $monthS $yearS';
  }

  // String _put0OnTime(String time) {
  //   if (time.length == 1) {
  //     return '0$time';
  //   }
  //   return time;
  // }
}
