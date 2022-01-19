import 'package:flutter/material.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/state/models/dongsa-exercise-state.dart';

class DongsaNotifier with ChangeNotifier {
  late DongsaExerciseState state;
  late int dongsaIndex = 0;

  DongsaNotifier() {
    dongsaBank.shuffle();
    state = DongsaExerciseState(dongsa: dongsaBank[dongsaIndex]);
  }

  getUserInput(int index) {
    return state.getUserInput(index);
  }

  updateUserInput(int index, String newValue) {
    state.updateUserInput(index, newValue);
    notifyListeners();
  }

  clearState() {
    state = DongsaExerciseState(dongsa: dongsaBank[dongsaIndex]);
    notifyListeners();
  }

  setPreviousVerb() {
    if (dongsaIndex <= 0) {
      dongsaIndex = dongsaBank.length - 1;
    } else {
      dongsaIndex--;
    }

    state = DongsaExerciseState(dongsa: dongsaBank[dongsaIndex]);
    notifyListeners();
  }

  setNextVerb() {
    if (dongsaIndex >= dongsaBank.length - 1) {
      dongsaIndex = 0;
    } else {
      dongsaIndex++;
    }

    state = DongsaExerciseState(dongsa: dongsaBank[dongsaIndex]);
    notifyListeners();
  }
}
