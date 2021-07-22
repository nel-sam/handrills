import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/state/suja.exercise-notifier.dart';
import 'package:handrills/widgets/suja-exercise/number-chart-button.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/sigan-exercise.dart';
import 'package:provider/provider.dart';

class SujaExercise extends StatefulWidget {
  const SujaExercise({Key? key}) : super(key: key);

  @override
  _SujaExerciseState createState() => _SujaExerciseState();
}

class _SujaExerciseState extends State<SujaExercise> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    getCarousel(BuildContext context, SujaExerciseNotifier sujaModel) {
      return Center(
        child: SizedBox(
          height: screenSize.height - 250,
          width: screenSize.width,
          child: PageView.builder(
            itemCount: sujaModel.sujaExerciseState.siganExercises.length,
            controller: PageController(viewportFraction: 0.9),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: SiganExercise(
                    siganExerciseState:
                        sujaModel.sujaExerciseState.siganExercises[_index],
                    onUserHourSet: sujaModel.setUserHour,
                    onUserMinSet: sujaModel.setUserMin,
                    onUserSecSet: sujaModel.setUserSec,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              child: Column(
                children: [
                  NumberChartButton(),
                  getCarousel(context, sujaModel),
                ],
              ),
            ),
          ),
        ));
  }
}
