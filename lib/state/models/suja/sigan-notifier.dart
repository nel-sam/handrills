import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';

class SiganNotifier extends ChangeNotifier {
  late List<SiganExerciseState> _states;
  int activeStateIndex = 0;

  SiganNotifier() {
    this._states = _createSiganExercises();
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

  SiganExerciseState getActive() {
    return _states[activeStateIndex];
  }

  void clearInput() {
    _states[activeStateIndex].userHour = '';
    _states[activeStateIndex].userMin = '';
    _states[activeStateIndex].userSec = '';
    notifyListeners();
  }

  updateHour(String input) {
    var active = getActive();
    active.userHour = input;
    notifyListeners();
  }

  updateMin(String input) {
    var active = getActive();
    active.userMin = input;
    notifyListeners();
  }

  updateSec(String input) {
    var active = getActive();
    active.userSec = input;
    notifyListeners();
  }

  List<SiganExerciseState> _createSiganExercises() {
    List<SiganExerciseState> siganExercises = [];

    for (int i = 0; i < SIGAN_EXERCISE_COUNT; i++) {
      var hourDigit = HD.getRandomNumber(min: 0, max: 23);

      var hour = hourDigit < 13
          ? nativeNumberBank[hourDigit]
          : HD.getSinoNumber(hourDigit);
      var min = HD.getRandomSinoNumber(min: 1, max: 59);
      var sec = HD.getRandomSinoNumber(min: 1, max: 59);

      siganExercises.add(SiganExerciseState(
        hour: hour.digit < 10 ? '0${hour.digit}' : hour.digit.toString(),
        min: min.digit < 10 ? '0${min.digit}' : min.digit.toString(),
        sec: sec.digit < 10 ? '0${sec.digit}' : sec.digit.toString(),
        correctHour: hour.alternate,
        correctMin: min.written,
        correctSec: sec.written,
      ));
    }

    return siganExercises;
  }
}
