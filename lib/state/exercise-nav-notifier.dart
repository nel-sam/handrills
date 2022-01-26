import 'package:flutter/material.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/suja/count-generator.dart';

class ExerciseNavNotifier extends ChangeNotifier {
  int activeStateIndex = 0;
  List states = [];

  ExerciseNavNotifier(ExerciseType exerciseType) {
    switch (exerciseType) {
      case ExerciseType.Dongsa:
        // TODO: Handle this case.
        break;
      case ExerciseType.Count:
        this.states = CountGenerator.createCountingExercises();
        break;
      case ExerciseType.Age:
        // TODO: Handle this case.
        break;
      case ExerciseType.Sigan:
        // TODO: Handle this case.
        break;
    }
  }

  getActive() {
    return states[activeStateIndex];
  }

  void clearInput() {
    states[activeStateIndex].clear();
    notifyListeners();
  }

  setPrevious() {
    if (activeStateIndex <= 0) {
      activeStateIndex = states.length - 1;
    } else {
      activeStateIndex--;
    }

    notifyListeners();
  }

  setNext() {
    if (activeStateIndex >= states.length - 1) {
      activeStateIndex = 0;
    } else {
      activeStateIndex++;
    }

    notifyListeners();
  }
}
