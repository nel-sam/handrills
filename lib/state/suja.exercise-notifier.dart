import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/models/age-exercise-state.dart';
import 'package:handrills/state/models/count-exercise-state.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';
import 'package:handrills/state/models/suja-exercise-state.dart';

class SujaExerciseNotifier with ChangeNotifier {
  late SujaExerciseState sujaExerciseState;

  SujaExerciseNotifier() {
    sujaExerciseState = SujaExerciseState(
      countExercises: createCountingExercises(),
      ageExercises: createAgeExercises(),
    );
  }

  List<CountExerciseState> createCountingExercises() {
    List<CountExerciseState> countExerciseState = [];

    for (int i = 0; i < COUNTING_EXERCISE_NATIVE_COUNT; i++) {
      var hanNumb = HD.getRandomNativeNumber();
      var random = HD.getRandomNumber(min: 0, max: 1);

      switch (random) {
        case 0:
          countExerciseState.add(
            CountExerciseState(
              icon: Icons.person,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '명',
            ),
          );
          break;
        case 1:
        default:
          countExerciseState.add(
            CountExerciseState(
              icon: Icons.pets,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '마리',
            ),
          );
      }
    }

    return countExerciseState;
  }

  List<AgeExerciseState> createAgeExercises() {
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

  setUserHour(SiganExerciseState siganExerciseState, String userHour) {
    siganExerciseState.userHour = userHour;
    notifyListeners();
  }

  setUserMin(SiganExerciseState siganExerciseState, String userMin) {
    siganExerciseState.userMin = userMin;
    notifyListeners();
  }

  setUserSec(SiganExerciseState siganExerciseState, String userSec) {
    siganExerciseState.userSec = userSec;
    notifyListeners();
  }

  onUserCountSet(CountExerciseState state, String userInput) {
    state.userInput = userInput;
    notifyListeners();
  }

  onAgeSet(AgeExerciseState state, String userInput) {
    state.userInput = userInput;
    notifyListeners();
  }
}
