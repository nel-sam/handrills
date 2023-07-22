import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/state/dongsa/dongsa_exercise_state.dart';

class DongsaGenerator {
  late List<Dongsa> bank;

  DongsaGenerator(bool isShuffled, List<Dongsa> selectedVerbs) {
    bank = [...selectedVerbs];

    if (isShuffled) bank.shuffle();
  }

  createExercise(int index) {
    return DongsaExerciseState(dongsa: bank[index]);
  }
}
