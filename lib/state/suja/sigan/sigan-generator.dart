import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/suja/sigan/sigan-exercise-state.dart';

class SiganGenerator {
  static List<SiganExerciseState> createSiganExercises() {
    List<SiganExerciseState> siganExercises = [];

    for (int i = 0; i < SIGAN_EXERCISE_COUNT; i++) {
      var hourDigit = HD.getRandomNumber(min: 0, max: 23);

      var hour = hourDigit < 13
          ? nativeNumberBank[hourDigit]
          : HD.getSinoNumber(hourDigit);
      var min = HD.getRandomSinoNumber(min: 1, max: 59);
      var sec = HD.getRandomSinoNumber(min: 1, max: 59);

      siganExercises.add(SiganExerciseState(
        hour: hour.digit < 10 ? '0${hour.digit}' : hour.digit.toString(),
        min: min.digit < 10 ? '0${min.digit}' : min.digit.toString(),
        sec: sec.digit < 10 ? '0${sec.digit}' : sec.digit.toString(),
        correctHour: hour.alternate,
        correctMin: min.written,
        correctSec: sec.written,
      ));
    }

    return siganExercises;
  }
}
