import 'package:unify/utils/formatter/number_formatter.dart';

String statsFormatter(int count, String type) {
  switch (type) {
    case "trophy":
      return "${thousandFormatter(count)} trophies";
    case "3v3":
      return "${thousandFormatter(count)} 3v3 wins";
    case "2v2":
      return "${thousandFormatter(count)} 2v2 wins";
    case "solo":
      return "${thousandFormatter(count)} solo wins";
    default:
      return "";
  }
}

