import 'package:intl/intl.dart';

class DateTimeFormat {
  DateTime? convertStringToDateTime(
    String timeString, {
    String formatString = "yyyy/MM/dd HH:mm:ss",
  }) {
    DateFormat dateFormat = DateFormat(formatString);
    return dateFormat.parse(timeString);
  }

  String? convertDateTimeToString(
    DateTime dateTime, {
    String formatString = "yMMMMEEEEd",
  }) {
    var format = DateFormat(formatString).format(dateTime);
    return format;
  }

  String convertToRemainTime(DateTime inputTime) {
    final remainTime = inputTime.difference(DateTime.now());
    if (remainTime.inDays > 0) {
      return "${remainTime.inDays} days";
    } else if (remainTime.inHours > 0) {
      return "${remainTime.inHours} hours";
    } else if (remainTime.inMinutes > 0) {
      return "${remainTime.inMinutes} min";
    } else if (remainTime.inSeconds > 0) {
      return "${remainTime.inSeconds} s";
    }
    print("Remain time: ${remainTime}");
    return "--";
  }
}
