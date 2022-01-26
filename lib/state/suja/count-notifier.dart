import 'package:flutter/material.dart';
import 'package:handrills/state/suja/count-exercise-state.dart';

class CountNotifier with ChangeNotifier {
  late Function() _getStateItem;

  CountNotifier(Function() getStateItem) {
    _getStateItem = getStateItem;
  }

  CountExerciseState getStateItem() {
    return _getStateItem();
  }

  updateCount(String userInput) {
    _getStateItem().userInput = userInput;
    notifyListeners();
  }
}
