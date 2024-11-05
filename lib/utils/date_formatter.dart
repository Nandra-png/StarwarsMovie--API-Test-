import 'package:intl/intl.dart';

class DateFormatter {
  static String formatToIndonesian(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);
  }
}
