import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/susja/count/count_exercise_state.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class CountGenerator {
  static createExercise(int index) {
    var countType = Nrs.getRandomNumber(max: 2);

    if (countType == 0) {
      var sinoNumb = HD.getRandomSinoNumber(min: 1);
      var random = Nrs.getRandomNumber(min: 0, max: 3);

      switch (random) {
        case 0:
          final counter = '월';
          return CountExerciseState(
            isSino: true,
            icon: Icons.calendar_month_outlined,
            label: HD.t('months'),
            count: sinoNumb.digit,
            correctAnswers: [
              sinoNumb.written + counter,
              sinoNumb.alternate + counter
            ],
            counter: counter,
          );

        case 1:
          final counter = '일';
          return CountExerciseState(
            isSino: true,
            icon: Icons.calendar_today_outlined,
            label: HD.t('days'),
            count: sinoNumb.digit,
            correctAnswers: [
              sinoNumb.written + counter,
              sinoNumb.alternate + counter
            ],
            counter: counter,
          );

        case 2:
          final counter = '년';
          return CountExerciseState(
            isSino: true,
            icon: Icons.wb_twighlight,
            label: HD.t('years'),
            count: sinoNumb.digit,
            correctAnswers: [
              sinoNumb.written + counter,
              sinoNumb.alternate + counter
            ],
            counter: counter,
          );
      }
    }

    var hanNumb = HD.getRandomNativeNumber(min: 1);
    var random = Nrs.getRandomNumber(min: 0, max: 7);

    switch (random) {
      case 0:
        final counter = '명';
        return CountExerciseState(
          isSino: false,
          icon: Icons.person,
          label: HD.t('people'),
          count: hanNumb.digit,
          correctAnswers: [
            hanNumb.written + counter,
            hanNumb.alternate + counter
          ],
          counter: counter,
        );

      case 1:
        final counter = '마리';
        return CountExerciseState(
          isSino: false,
          icon: Icons.pets,
          label: HD.t('animals'),
          count: hanNumb.digit,
          correctAnswers: [
            hanNumb.written + counter,
            hanNumb.alternate + counter
          ],
          counter: counter,
        );

      case 2:
        final counter = '병';
        return CountExerciseState(
          isSino: false,
          icon: Icons.wine_bar,
          label: HD.t('bottles'),
          count: hanNumb.digit,
          correctAnswers: [
            hanNumb.written + counter,
            hanNumb.alternate + counter
          ],
          counter: counter,
        );

      case 3:
        final counter = '개';
        return CountExerciseState(
          isSino: false,
          icon: Icons.bike_scooter,
          label: HD.t('things'),
          count: hanNumb.digit,
          correctAnswers: [
            hanNumb.written + counter,
            hanNumb.alternate + counter
          ],
          counter: counter,
        );

      case 4:
        final counter = '권';
        return CountExerciseState(
          isSino: false,
          icon: Icons.book_outlined,
          label: HD.t('books'),
          count: hanNumb.digit,
          correctAnswers: [
            hanNumb.written + counter,
            hanNumb.alternate + counter
          ],
          counter: counter,
        );

      case 5:
        final counter = '조각';
        return CountExerciseState(
          isSino: false,
          icon: Icons.local_pizza_outlined,
          label: HD.t('slices'),
          count: hanNumb.digit,
          correctAnswers: [
            hanNumb.written + counter,
            hanNumb.alternate + counter
          ],
          counter: counter,
        );

      case 6:
        final counter = '대';
        return CountExerciseState(
          isSino: false,
          icon: Icons.car_rental_outlined,
          label: HD.t('cars_machines'),
          count: hanNumb.digit,
          correctAnswers: [
            hanNumb.written + counter,
            hanNumb.alternate + counter
          ],
          counter: counter,
        );
    }
  }

  static int getMaxIndex() {
    return COUNT_EXERCISE_COUNT;
  }
}
