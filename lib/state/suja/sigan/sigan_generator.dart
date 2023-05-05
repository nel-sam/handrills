import 'package:handrills/constants.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/suja/sigan/sigan_exercise_state.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class SiganGenerator {
  static createExercise(int index) {
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
      correctHours: [hour.written, hour.alternate],
      correctMins: [hour.written, hour.alternate],
      correctSecs: [sec.written, sec.alternate]
    );
  }

  static int getMaxIndex() {
    return SIGAN_EXERCISE_COUNT;
  }
}
