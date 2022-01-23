import 'package:flutter/material.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/state/dongsa/dongsa-exercise-state.dart';

class DongsaNotifier with ChangeNotifier {
  late List<DongsaExerciseState> _states = [];
  late int dongsaIndex = 0;

  DongsaNotifier() {
    dongsaBank.shuffle();

    for (int i = 0; i < dongsaBank.length; i++) {
      _states.add(DongsaExerciseState(dongsa: dongsaBank[i]));
    }
  }

  getActive() {
    return _states[dongsaIndex];
  }

  getUserInput(int index) {
    return _states[dongsaIndex].getUserInput(index);
  }

  updateUserInput(int index, String newValue) {
    _states[dongsaIndex].updateUserInput(index, newValue);
    notifyListeners();
  }

  clearInput() {
    _states[dongsaIndex].userInput.clear();
    notifyListeners();
  }

  setPrevious() {
    if (dongsaIndex <= 0) {
      dongsaIndex = dongsaBank.length - 1;
    } else {
      dongsaIndex--;
    }

    notifyListeners();
  }

  setNext() {
    if (dongsaIndex >= dongsaBank.length - 1) {
      dongsaIndex = 0;
    } else {
      dongsaIndex++;
    }

    notifyListeners();
  }
}
