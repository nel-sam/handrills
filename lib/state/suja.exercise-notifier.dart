import 'package:flutter/foundation.dart';
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
    sujaExerciseState = SujaExerciseState(siganExercises: siganExercises);
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
}
