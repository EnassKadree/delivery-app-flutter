part of 'functions.dart';



extension FormatNumber on Functions{
String formatNumberWithCommas(int number) {
  var formatter = NumberFormat.decimalPattern();
  return formatter.format(number);
}
}
