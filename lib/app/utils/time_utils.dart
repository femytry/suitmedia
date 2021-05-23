import 'package:intl/intl.dart';

class TimeUtils{
  static String formatDate(String date){
    var temp = DateTime.now();
    if (date.isNotEmpty) {
      temp = DateTime.parse(date);
    }
    var formatter = new DateFormat('MMM dd, yyyy');
    String formattedDate = formatter.format(temp);
    return formattedDate;
  }
}