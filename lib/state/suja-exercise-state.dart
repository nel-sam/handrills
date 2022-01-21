import 'package:handrills/state/count-exercise-state.dart';

class SujaExerciseState {
  List<CountExerciseState> countExercises;

  late List<dynamic> _all = [];

  SujaExerciseState({
    required this.countExercises,
  });

  List<dynamic> getAll() {
    if (_all.length > 0) return _all;

    _all.addAll(countExercises);
    _all.shuffle();
    return _all;
  }
}
