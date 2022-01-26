import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/suja/count/count-exercise-state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountGenerator {
  static List<CountExerciseState> createCountingExercises() {
    List<CountExerciseState> countExerciseState = [];

    for (int i = 0; i < COUNTING_EXERCISE_SINO_COUNT; i++) {
      var sinoNumb = HD.getRandomSinoNumber(min: 1);
      var random = HD.getRandomNumber(min: 0, max: 3);

      switch (random) {
        case 0:
          countExerciseState.add(
            CountExerciseState(
              isSino: true,
              icon: Icons.calendar_month_outlined,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.months,
              count: sinoNumb.digit,
              correctAnswer: sinoNumb.alternate,
              counter: '월',
            ),
          );
          break;
        case 1:
          countExerciseState.add(
            CountExerciseState(
              isSino: true,
              icon: Icons.calendar_today_outlined,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.days,
              count: sinoNumb.digit,
              correctAnswer: sinoNumb.alternate,
              counter: '일',
            ),
          );
          break;
        case 2:
          countExerciseState.add(
            CountExerciseState(
              isSino: true,
              icon: Icons.wb_twighlight,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.years,
              count: sinoNumb.digit,
              correctAnswer: sinoNumb.alternate,
              counter: '년',
            ),
          );
          break;
      }
    }

    for (int i = 0; i < COUNTING_EXERCISE_NATIVE_COUNT; i++) {
      var hanNumb = HD.getRandomNativeNumber(min: 1);
      var random = HD.getRandomNumber(min: 0, max: 7);

      switch (random) {
        case 0:
          countExerciseState.add(
            CountExerciseState(
              isSino: false,
              icon: Icons.person,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.people,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '명',
            ),
          );
          break;
        case 1:
          countExerciseState.add(
            CountExerciseState(
              isSino: false,
              icon: Icons.pets,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.animals,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '마리',
            ),
          );
          break;
        case 2:
          countExerciseState.add(
            CountExerciseState(
              isSino: false,
              icon: Icons.wine_bar,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.bottles,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '병',
            ),
          );
          break;
        case 3:
          countExerciseState.add(
            CountExerciseState(
              isSino: false,
              icon: Icons.bike_scooter,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.things,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '개',
            ),
          );
          break;
        case 4:
          countExerciseState.add(
            CountExerciseState(
              isSino: false,
              icon: Icons.book_outlined,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.books,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '권',
            ),
          );
          break;
        case 5:
          countExerciseState.add(
            CountExerciseState(
              isSino: false,
              icon: Icons.local_pizza_outlined,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.slices,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '조각',
            ),
          );
          break;
        case 6:
          countExerciseState.add(
            CountExerciseState(
              isSino: false,
              icon: Icons.car_rental_outlined,
              getLabel: (BuildContext context) =>
                  AppLocalizations.of(context)!.cars_machines,
              count: hanNumb.digit,
              correctAnswer: hanNumb.alternate,
              counter: '대',
            ),
          );
          break;
      }
    }

    countExerciseState.shuffle();
    return countExerciseState;
  }
}
