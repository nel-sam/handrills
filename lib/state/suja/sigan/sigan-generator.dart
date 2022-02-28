import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/suja/sigan/sigan-exercise-state.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class SiganGenerator {
  static createExercise(int index) {
    for (int i = 0; i < SIGAN_EXERCISE_COUNT; i++) {
      var hourDigit = Nrs.getRandomNumber(min: 0, max: 23);

      var hour = hourDigit < 13
          ? nativeNumberBank[hourDigit]
          : HD.getSinoNumber(hourDigit);
      var min = HD.getRandomSinoNumber(min: 1, max: 59);
      var sec = HD.getRandomSinoNumber(min: 1, max: 59);

      return SiganExerciseState(
        hour: hour.digit < 10 ? '0${hour.digit}' : hour.digit.toString(),
        min: min.digit < 10 ? '0${min.digit}' : min.digit.toString(),
        sec: sec.digit < 10 ? '0${sec.digit}' : sec.digit.toString(),
        correctHour: hour.alternate,
        correctMin: min.written,
        correctSec: sec.written,
      );
    }
  }

  static int getMaxIndex() {
    return SIGAN_EXERCISE_COUNT;
  }
}
