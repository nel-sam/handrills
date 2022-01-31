import 'dart:async';

import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/state/dongsa/dongs-generator.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/suja/age/age-generator.dart';
import 'package:handrills/state/suja/count/count-generator.dart';
import 'package:handrills/state/suja/sigan/sigan-generator.dart';

class ExerciseNavNotifier extends ChangeNotifier {
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});
  int _activeIndex = 0;
  List _states = [];

  ExerciseNavNotifier(ExerciseType exerciseType) {
    switch (exerciseType) {
      case ExerciseType.Dongsa:
        this._states = DongsaGenerator.createDongsaExercises();
        break;
      case ExerciseType.Count:
        this._states = CountGenerator.createCountingExercises();
        break;
      case ExerciseType.Age:
        this._states = AgeGenerator.createAgeExercises();
        break;
      case ExerciseType.Sigan:
        this._states = SiganGenerator.createSiganExercises();
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
    return _states[_activeIndex];
  }

  void clearInput() {
    _states[_activeIndex].clear();
    deboucedNotifyListeners();
  }

  setPrevious() {
    if (_activeIndex <= 0) {
      _activeIndex = _states.length - 1;
    } else {
      _activeIndex--;
    }

    deboucedNotifyListeners();
  }

  setNext() {
    if (_activeIndex >= _states.length - 1) {
      _activeIndex = 0;
    } else {
      _activeIndex++;
    }

    deboucedNotifyListeners();
  }
}
