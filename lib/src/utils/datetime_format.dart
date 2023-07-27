import 'package:intl/intl.dart';

class DateTimeFormat {
  DateTime? convertStringToDateTime(
    String timeString, {
    String formatString = "yyyy/MM/dd HH:mm:ss",
  }) {
    DateFormat dateFormat = DateFormat(formatString);
    return dateFormat.parse(timeString);
  }


}
