import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/suja/count-exercise-state.dart';

class CountNotifier with ChangeNotifier {
  late List<CountExerciseState> _states;
  int activeStateIndex = 0;

  CountNotifier() {
    _states = _createCountingExercises();
  }

  List<CountExerciseState> _createCountingExercises() {
    List<CountExerciseState> countExerciseState = [];

    for (int i = 0; i < COUNTING_EXERCISE_NATIVE_COUNT; i++) {
      var hanNumb = HD.getRandomNativeNumber();
      var random = HD.getRandomNumber(min: 0, max: 1);

      switch (random) {
        case 0:
          countExerciseState.add(
            CountExerciseState(
              icon: Icons.person,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '명',
            ),
          );
          break;
        case 1:
        default:
          countExerciseState.add(
            CountExerciseState(
              icon: Icons.pets,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '마리',
            ),
          );
      }
    }

    return countExerciseState;
  }

  updateCount(String userInput) {
    _states[activeStateIndex].userInput = userInput;
    notifyListeners();
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

  CountExerciseState getActive() {
    return _states[activeStateIndex];
  }

  void clearInput() {
    _states[activeStateIndex].userInput = '';
    notifyListeners();
  }
}
