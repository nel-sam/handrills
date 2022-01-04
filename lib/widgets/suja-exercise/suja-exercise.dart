import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/state/models/age-exercise-state.dart';
import 'package:handrills/state/models/count-exercise-state.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';
import 'package:handrills/state/suja.exercise-notifier.dart';
import 'package:handrills/widgets/shared/footer-button.dart';
import 'package:handrills/widgets/shared/home-button.dart';
import 'package:handrills/widgets/suja-exercise/age/age-exercise.dart';
import 'package:handrills/widgets/suja-exercise/counting.dart/counting-exercise.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
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
    var footerButtonWidth = (screenSize.width / 2) - 20;

    getCarousel(BuildContext context, SujaExerciseNotifier sujaModel) {
      return Center(
        child: SizedBox(
          height: screenSize.height - 220,
          width: screenSize.width,
          child: PageView.builder(
            itemCount: sujaModel.sujaExerciseState.getAll().length,
            controller: PageController(viewportFraction: 0.9),
            onPageChanged: (int index) => setState(() {
              _index = index > _index ? _index + 1 : _index - 1;
            }),
            itemBuilder: (_, i) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: getExerciseWidget(
                      sujaModel,
                      _index,
                      () => setState(() {
                            _index++;
                          })),
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
                getCarousel(context, sujaModel),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        HomeButton(width: footerButtonWidth),
        FooterButton(
          width: footerButtonWidth,
          context: context,
          text: AppLocalizations.of(context)!.numberChart,
          icon: Icons.list,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NumberChart()),
            );
          },
        ),
      ],
    );
  }

  dynamic getExerciseWidget(
    SujaExerciseNotifier sujaModel,
    int indx,
    Function() onNextButtonPressed,
  ) {
    final itemfromList = sujaModel.sujaExerciseState.getAll()[indx];

    if (itemfromList is SiganExerciseState)
      return SiganExercise(
        siganExerciseState: itemfromList,
        onUserHourSet: sujaModel.setUserHour,
        onUserMinSet: sujaModel.setUserMin,
        onUserSecSet: sujaModel.setUserSec,
        onNextButtonPressed: onNextButtonPressed,
      );

    if (itemfromList is CountExerciseState)
      return CountingExercise(
        state: itemfromList,
        onUserCountSet: sujaModel.onUserCountSet,
        onNextButtonPressed: onNextButtonPressed,
      );

    if (itemfromList is AgeExerciseState)
      return AgeExercise(
        state: itemfromList,
        onAgeSet: sujaModel.onAgeSet,
        onNextButtonPressed: onNextButtonPressed,
      );
  }
}
