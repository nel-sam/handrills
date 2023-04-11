import 'package:handrills/constants.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/suja/age/age_exercise_state.dart';

class AgeGenerator {
  static createExercise(int index) {
    HanNumber number = HD.getRandomNativeNumber();

    return AgeExerciseState(
      age: number.digit,
      correctAnswer: number.alternate,
    );
  }

  static int getMaxIndex() {
    return AGE_EXERCISE_COUNT;
  }
}
