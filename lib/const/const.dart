import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


// Utilites Class
class Specs
{
  Color cBlue_200 = (Colors.blue[200])!;
  Color cBlue_300 = (Colors.blue[300])!;
  Color cBlue_400 = (Colors.blue[400])!;

  Color cRed_200 = (Colors.red[200])!;
  Color cRed_300 = (Colors.red[300])!;
  Color cRed_400 = (Colors.red[400])!;
  Color cRed_500 = (Colors.red[500])!;
  Color cRed = (Colors.red);

  Color cYellow_200 = (Colors.yellow[200])!;
  Color cYellow_300 = (Colors.yellow[300])!;
  Color cYellow_400 = (Colors.yellow[400])!;

  Color cOrange_200 = (Colors.orange[200])!;
  Color cOrange_300 = (Colors.orange[300])!;
  Color cOrange_400 = (Colors.orange[400])!;

  Color cGray_200 = (Colors.grey[200])!;
  Color cGray_300 = (Colors.grey[300])!;
  Color cGray_400 = (Colors.grey[400])!;

  Color cPurple_100 = (Colors.purple[100])!;
  Color cPurple_150 = (const Color.fromARGB(255, 165, 109, 174));
  Color cPurple_200 = (Colors.purple[200])!;
  Color cPurple_300 = (Colors.purple[300])!;
  Color cPurple_400 = (Colors.purple[400])!;
  Color cPurple_500 = (Colors.purple[500])!;

  Color cCyanRGB = const Color.fromARGB(255, 55, 140, 150);

  Color cBlackRGB = const Color.fromARGB(0, 0, 0, 0);
  Color cBlack = (Colors.black);

  double btnWidth_150 = 150.0;
  double btnWidth_250 = 250.0;
  double btnWidth_350 = 350.0;

  double btnHeight_30 = 30.0;
  double btnHeight_40 = 40.0;
  double btnHeight_50 = 50.0;

  Icon icon = const Icon(Icons.access_alarm);
  // Icon icon_ = const Icon(Icons.);
  // Icon icon_ = const Icon(Icons.);
  // Icon icon_ = const Icon(Icons.);

}


class SerialNumberFormatter extends TextInputFormatter
{
 @override
 TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text;
    StringBuffer buffer = StringBuffer();
    int hyphenCount = 0;
    for (int i = 0; i < enteredData.length; i++) {
      if (enteredData[i] == '-') {
        hyphenCount++;
      } else {
        buffer.write(enteredData[i]);
        if ((buffer.length - hyphenCount) % 4 == 0 && enteredData.length != i + 1) {
          buffer.write('-');
        }
      }
    }

    return TextEditingValue
    (
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
 }
}


class MyDateTimeClass
{
  static String formattedDate = DateFormat('yyyy-MM-dd – HH-mm-ss').format(DateTime.now());
}


String toArabicNumber(int number)
{
  const arabicDigits = '٠١٢٣٤٥٦٧٨٩';
  return number.toString().split('').map((digit)
  {
    return arabicDigits[int.parse(digit)];
  }).join('');
}


dynamic toEnglishNumber(int number)
{
  const EnglishDigits = '0123456789';
  return number.toString().split('').map((digit)
  {
    print(number);
    return EnglishDigits[int.parse(digit)];
  }).join('');

}