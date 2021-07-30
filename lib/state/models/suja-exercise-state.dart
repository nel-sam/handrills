import 'package:handrills/state/models/age-exercise-state.dart';
import 'package:handrills/state/models/count-exercise-state.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';

class SujaExerciseState {
  List<SiganExerciseState> siganExercises;
  List<CountExerciseState> countExercises;
  List<AgeExerciseState> ageExercises;

  late List<dynamic> _all = [];

  SujaExerciseState({
    required this.siganExercises,
    required this.countExercises,
    required this.ageExercises,
  });

  List<dynamic> getAll() {
    if (_all.length > 0) return _all;

    _all.addAll(siganExercises);
    _all.addAll(countExercises);
    _all.addAll(ageExercises);
    _all.shuffle();
    return _all;
  }
}
