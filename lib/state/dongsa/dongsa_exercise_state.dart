import 'dart:collection';

import 'package:handrills/lang_data/dongsa.dart';

class DongsaExerciseState {
  HashMap<int, String> userInput = new HashMap<int, String>();
  Dongsa dongsa;

  DongsaExerciseState({required this.dongsa});

  getUserInput(int index) {
    return userInput[index] ?? '';
  }

  updateUserInput(int index, String newValue) {
    userInput[index] = newValue;
  }

  clear() {
    userInput.clear();
  }
}
