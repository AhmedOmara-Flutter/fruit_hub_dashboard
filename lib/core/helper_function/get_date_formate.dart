import 'package:intl/intl.dart';

String getDateFormate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);

  String formattedDate = DateFormat(
    'h:mm a - d MMMM yyyy',
    'ar',
  ).format(dateTime);

  return formattedDate;
}

String getMonthName(int month) {
  const months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  return months[month - 1];
}