import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/suja/age/age-exercise-state.dart';

class AgeNotifier extends ChangeNotifier {
  late List<AgeExerciseState> _states;
  int activeStateIndex = 0;

  AgeNotifier() {
    this._states = _createAgeExercises();
  }

  List<AgeExerciseState> _createAgeExercises() {
    List<AgeExerciseState> ageExerciseState = [];

    for (int i = 0; i < AGE_EXERCISE_COUNT; i++) {
      HanNumber number = HD.getRandomNativeNumber();

      ageExerciseState.add(
        AgeExerciseState(
          age: number.digit,
          correctAnswer: number.alternate,
        ),
      );
    }
    return ageExerciseState;
  }

  setPrevious() {
    if (activeStateIndex <= 0) {
      activeStateIndex = _states.length - 1;
    } else {
      activeStateIndex--;
    }

    notifyListeners();
  }

  setNext() {
    if (activeStateIndex >= _states.length - 1) {
      activeStateIndex = 0;
    } else {
      activeStateIndex++;
    }

    notifyListeners();
  }

  AgeExerciseState getActive() {
    return _states[activeStateIndex];
  }

  void clearInput() {
    _states[activeStateIndex].userInput = '';
    notifyListeners();
  }

  void updateAge(String newVal) {
    _states[activeStateIndex].userInput = newVal;
    notifyListeners();
  }
}
