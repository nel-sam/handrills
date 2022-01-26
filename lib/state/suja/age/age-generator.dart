import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/suja/age/age-exercise-state.dart';

class AgeGenerator {
  static List<AgeExerciseState> createAgeExercises() {
    List<AgeExerciseState> ageExerciseState = [];

    for (int i = 0; i < AGE_EXERCISE_COUNT; i++) {
      HanNumber number = HD.getRandomNativeNumber();

      ageExerciseState.add(
        AgeExerciseState(
          age: number.digit,
          correctAnswer: number.alternate,
        ),
      );
    }
    return ageExerciseState;
  }
}
