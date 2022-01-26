import 'dart:async';

import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/suja/count/count-generator.dart';

class ExerciseNavNotifier extends ChangeNotifier {
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});
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

  deboucedNotifyListeners() {
    if (!_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(
        const Duration(milliseconds: DEBOUNCE_TIME), () => notifyListeners());
  }

  getActive() {
    return states[activeStateIndex];
  }

  void clearInput() {
    states[activeStateIndex].clear();
    deboucedNotifyListeners();
  }

  setPrevious() {
    if (activeStateIndex <= 0) {
      activeStateIndex = states.length - 1;
    } else {
      activeStateIndex--;
    }

    deboucedNotifyListeners();
  }

  setNext() {
    if (activeStateIndex >= states.length - 1) {
      activeStateIndex = 0;
    } else {
      activeStateIndex++;
    }

    deboucedNotifyListeners();
  }
}
