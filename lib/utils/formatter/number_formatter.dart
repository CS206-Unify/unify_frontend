import 'package:intl/intl.dart';

String thousandFormatter(int number) {
  var formatter = NumberFormat("#,###");
  return formatter.format(number);
}
