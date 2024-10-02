import 'package:intl/intl.dart';

class Helper {
  static String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '').replaceAll("&nbsp;", "");
  }

  static String contentText(String text) {
    var textClean = removeAllHtmlTags(text);
    textClean.length > 10 ? textClean.substring(0, 10) + '...' : textClean;

    return textClean;
  }

  static String dateText(String date) {
    return DateFormat("EEEE, d MMMM yyyy", "id_ID")
        .format(DateTime.parse(date.toString()));
  }

  static String rupiahFormat(int? money) {
    try {
      NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp. ',
        decimalDigits: 2,
      );
      return currencyFormatter.format(money);
    } catch (e) {
      return "";
    }
  }
}
