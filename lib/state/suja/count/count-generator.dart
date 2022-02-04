import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/suja/count/count-exercise-state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountGenerator {
  static createExercise(int index) {
    var countType = HD.getRandomNumber(max: 2);

    if (countType == 0) {
      var sinoNumb = HD.getRandomSinoNumber(min: 1);
      var random = HD.getRandomNumber(min: 0, max: 3);

      switch (random) {
        case 0:
          return CountExerciseState(
            isSino: true,
            icon: Icons.calendar_month_outlined,
            getLabel: (BuildContext context) =>
                AppLocalizations.of(context)!.months,
            count: sinoNumb.digit,
            correctAnswer: sinoNumb.alternate,
            counter: '월',
          );

        case 1:
          return CountExerciseState(
            isSino: true,
            icon: Icons.calendar_today_outlined,
            getLabel: (BuildContext context) =>
                AppLocalizations.of(context)!.days,
            count: sinoNumb.digit,
            correctAnswer: sinoNumb.alternate,
            counter: '일',
          );

        case 2:
          return CountExerciseState(
            isSino: true,
            icon: Icons.wb_twighlight,
            getLabel: (BuildContext context) =>
                AppLocalizations.of(context)!.years,
            count: sinoNumb.digit,
            correctAnswer: sinoNumb.alternate,
            counter: '년',
          );
      }
    }

    var hanNumb = HD.getRandomNativeNumber(min: 1);
    var random = HD.getRandomNumber(min: 0, max: 7);

    switch (random) {
      case 0:
        return CountExerciseState(
          isSino: false,
          icon: Icons.person,
          getLabel: (BuildContext context) =>
              AppLocalizations.of(context)!.people,
          count: hanNumb.digit,
          correctAnswer: hanNumb.alternate,
          counter: '명',
        );

      case 1:
        return CountExerciseState(
          isSino: false,
          icon: Icons.pets,
          getLabel: (BuildContext context) =>
              AppLocalizations.of(context)!.animals,
          count: hanNumb.digit,
          correctAnswer: hanNumb.alternate,
          counter: '마리',
        );

      case 2:
        return CountExerciseState(
          isSino: false,
          icon: Icons.wine_bar,
          getLabel: (BuildContext context) =>
              AppLocalizations.of(context)!.bottles,
          count: hanNumb.digit,
          correctAnswer: hanNumb.alternate,
          counter: '병',
        );

      case 3:
        return CountExerciseState(
          isSino: false,
          icon: Icons.bike_scooter,
          getLabel: (BuildContext context) =>
              AppLocalizations.of(context)!.things,
          count: hanNumb.digit,
          correctAnswer: hanNumb.alternate,
          counter: '개',
        );

      case 4:
        return CountExerciseState(
          isSino: false,
          icon: Icons.book_outlined,
          getLabel: (BuildContext context) =>
              AppLocalizations.of(context)!.books,
          count: hanNumb.digit,
          correctAnswer: hanNumb.alternate,
          counter: '권',
        );

      case 5:
        return CountExerciseState(
          isSino: false,
          icon: Icons.local_pizza_outlined,
          getLabel: (BuildContext context) =>
              AppLocalizations.of(context)!.slices,
          count: hanNumb.digit,
          correctAnswer: hanNumb.alternate,
          counter: '조각',
        );

      case 6:
        return CountExerciseState(
          isSino: false,
          icon: Icons.car_rental_outlined,
          getLabel: (BuildContext context) =>
              AppLocalizations.of(context)!.cars_machines,
          count: hanNumb.digit,
          correctAnswer: hanNumb.alternate,
          counter: '대',
        );
    }
  }

  static int getMaxIndex() {
    return COUNT_EXERCISE_COUNT;
  }
}
