
import 'dart:ffi';

import '../models/product/photo.dart';
import '../secrets.dart';

extension SE on String {
  String formatNumber(int? number) {
    if (number == null) {
      return '';
    }

    String numberString = number.toString();
    int length = numberString.length;

    if (length <= 3) {
      return numberString;
    }

    StringBuffer formattedNumber = StringBuffer();
    int count = 0;

    for (int i = length - 1; i >= 0; i--) {
      count++;
      formattedNumber.write(numberString[i]);
      if (count == 3 && i != 0) {
        formattedNumber.write(',');
        count = 0;
      }
    }

    return formattedNumber.toString().split('').reversed.join('');
  }
  String get thousandsFormatter =>
      formatNumber(int.parse(this));

}

extension PE on Photo {

  String get link =>
      '${ AppSecrets.baseUrl}images/$url';
}