class HanNumber {
  final String digit;
  final String written;
  final String alternate;

  HanNumber({required this.digit, required this.written, this.alternate = ''});
}

final List<HanNumber> nativeNumberBank = [
  HanNumber(digit: '0', written: '영'),
  HanNumber(digit: '1', written: '하나', alternate: '한'),
  HanNumber(digit: '2', written: '들', alternate: '드'),
];

final List<HanNumber> sinoNumberBank = [];
