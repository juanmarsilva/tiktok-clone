import 'package:intl/intl.dart';

class HumanFormats {

  /*
    * Se coloca static para no tener que crear una instancia para acceder a dichos metodos 
  */
  static String humanReadbleNumber(double number) {

    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format(number);

    return formatterNumber;
  }

}