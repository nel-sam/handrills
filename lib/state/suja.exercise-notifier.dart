import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/state/models/age-exercise-state.dart';
import 'package:handrills/state/models/count-exercise-state.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';
import 'package:handrills/state/models/suja-exercise-state.dart';

class SujaExerciseNotifier with ChangeNotifier {
  late SujaExerciseState sujaExerciseState;

  SujaExerciseNotifier() {
    sujaExerciseState = SujaExerciseState(
      siganExercises: createSiganExercises(),
      countExercises: createCountingExercises(),
      ageExercises: createAgeExercises(),
    );
  }

  List<SiganExerciseState> createSiganExercises() {
    List<SiganExerciseState> siganExercises = [];

    for (int i = 0; i < SIGAN_EXERCISE_COUNT; i++) {
      var hourDigit = HD.getRandomNumber(min: 0, max: 23);

      var hour = hourDigit < 13
          ? nativeNumberBank[hourDigit]
          : HD.getSinoNumber(hourDigit);
      var min = getRandomSinoNumber(min: 1, max: 59);
      var sec = getRandomSinoNumber(min: 1, max: 59);

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

  List<CountExerciseState> createCountingExercises() {
    List<CountExerciseState> countExerciseState = [];

    for (int i = 0; i < COUNTING_EXERCISE_NATIVE_COUNT; i++) {
      var hanNumb = getRandomNativeNumber();
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

  List<AgeExerciseState> createAgeExercises() {
    List<AgeExerciseState> ageExerciseState = [];

    for (int i = 0; i < AGE_EXERCISE_COUNT; i++) {
      HanNumber number = getRandomNativeNumber();

      ageExerciseState.add(
        AgeExerciseState(
          age: number.digit,
          correctAnswer: number.alternate,
        ),
      );
    }
    return ageExerciseState;
  }

  HanNumber getRandomSinoNumber({int min = 0, int max = 99}) {
    return HD.getSinoNumber(HD.getRandomNumber(
      min: min,
      max: max,
    ));
  }

  HanNumber getRandomNativeNumber({int min = 0, int max = 99}) {
    return nativeNumberBank[HD.getRandomNumber(
      min: min,
      max: max,
    )];
  }

  setUserHour(SiganExerciseState siganExerciseState, String userHour) {
    siganExerciseState.userHour = userHour;
    notifyListeners();
  }

  setUserMin(SiganExerciseState siganExerciseState, String userMin) {
    siganExerciseState.userMin = userMin;
    notifyListeners();
  }

  setUserSec(SiganExerciseState siganExerciseState, String userSec) {
    siganExerciseState.userSec = userSec;
    notifyListeners();
  }

  onUserCountSet(CountExerciseState state, String userInput) {
    state.userInput = userInput;
    notifyListeners();
  }

  onAgeSet(AgeExerciseState state, String userInput) {
    state.userInput = userInput;
    notifyListeners();
  }
}
