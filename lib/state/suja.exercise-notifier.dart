import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:handrills/state/models/count-exercise-state.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';
import 'package:handrills/state/models/suja-exercise-state.dart';

class SujaExerciseNotifier with ChangeNotifier {
  late SujaExerciseState sujaExerciseState;

  SujaExerciseNotifier() {
    List<SiganExerciseState> siganExercises = [
      SiganExerciseState(
        hour: '05',
        min: '43',
        sec: '99',
        correctHour: '다섯',
        correctMin: '사십삼',
        correctSec: '구십구',
      ),
      SiganExerciseState(
        hour: '02',
        min: '09',
        sec: '30',
        correctHour: '두',
        correctMin: '구',
        correctSec: '삼십',
      )
    ];

    List<CountExerciseState> countExerciseState = [
      CountExerciseState(
        icon: Icons.person,
        count: 5,
        correctAnswer: '다섯',
        counter: '명',
      ),
      CountExerciseState(
        icon: Icons.pets,
        count: 3,
        correctAnswer: '세',
        counter: '마리',
      ),
    ];

    sujaExerciseState = SujaExerciseState(
      siganExercises: siganExercises,
      countExercises: countExerciseState,
    );

    sujaExerciseState.siganExercises.shuffle();
    sujaExerciseState.countExercises.shuffle();
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
}
