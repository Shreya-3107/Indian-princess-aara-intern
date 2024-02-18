import 'package:intl/intl.dart';

String stringFromDate(
    {required String dateString,
    required String format,
    required String convertFormat}) {
  try {
    DateTime inputDate = DateFormat(format).parse(dateString);
    return DateFormat(convertFormat).format(inputDate);
  } catch (err) {
    return dateString;
  }
}
