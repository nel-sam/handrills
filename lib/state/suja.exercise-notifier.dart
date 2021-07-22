import 'package:flutter/foundation.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';
import 'package:handrills/state/models/suja-exercise-state.dart';

class SujaExerciseNotifier with ChangeNotifier {
  late SujaExerciseState sujaExerciseState;

  SujaExerciseNotifier() {
    final sijanExerciseState = SiganExerciseState(
      hour: 5,
      min: 43,
      sec: 99,
      correctHour: '다섯',
      correctMin: '사십삼',
      correctSec: '구십구',
    );
    List<SiganExerciseState> siganExercises = [sijanExerciseState];
    sujaExerciseState = SujaExerciseState(siganExercises: siganExercises);
  }
}
