import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/state/suja.exercise-notifier.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/sigan-exercise.dart';
import 'package:provider/provider.dart';

class SujaExercise extends StatelessWidget {
  const SujaExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) => BackButton()),
          elevation: APPBAR_ELEVATION,
          backgroundColor: HD.getAppBarColor(context),
          textTheme: HD.getAppBarTextTheme(context),
          iconTheme: HD.getAppBarIconTheme(context),
          title: Text(AppLocalizations.of(context)!.numbers,
              style: HEADER_TEXT_STYLE),
        ),
        body: ChangeNotifierProvider<SujaExerciseNotifier>(
          create: (context) => SujaExerciseNotifier(),
          child: Consumer<SujaExerciseNotifier>(
            builder: (context, sujaModel, child) => Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NumberChart()),
                            );
                          },
                          child:
                              Text(AppLocalizations.of(context)!.numberChart)),
                    ),
                    ...sujaModel.sujaExerciseState.siganExercises
                        .map((e) => SiganExercise(
                              siganExerciseState: e,
                              onUserHourSet: sujaModel.setUserHour,
                              onUserMinSet: sujaModel.setUserMin,
                              onUserSecSet: sujaModel.setUserSec,
                            ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
