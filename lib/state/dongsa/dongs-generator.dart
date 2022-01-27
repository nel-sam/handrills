import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/state/dongsa/dongsa-exercise-state.dart';

class DongsaGenerator {
  static createDongsaExercises() {
    List<DongsaExerciseState> states = [];

    for (int i = 0; i < dongsaBank.length; i++) {
      states.add(DongsaExerciseState(dongsa: dongsaBank[i]));
    }

    states.shuffle();
    return states;
  }
}
