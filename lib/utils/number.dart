const List<String> _numberUnits = ['r', 'j', 'm', 't'];
String humanizeNumber(int number) {
  int i = 0;
  double fractionNumber = number / 1.0;
  for (; fractionNumber > 999; i++) {
    fractionNumber = fractionNumber / 1000;
  }
  String ret = fractionNumber < 10
      ? '${fractionNumber - fractionNumber.roundToDouble() > 0 ? fractionNumber.toStringAsFixed(1) : fractionNumber.toInt()}'
      : '${fractionNumber.floor()}';
  if (i > 0) {
    ret = '${ret}${_numberUnits[i - 1]}';
  }
  return ret;
}
