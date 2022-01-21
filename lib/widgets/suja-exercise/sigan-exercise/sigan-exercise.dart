import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/suja/sigan-notifier.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/answer-status-button.dart';
import 'package:handrills/widgets/shared/exercise-header.dart';
import 'package:handrills/widgets/shared/footer-button.dart';
import 'package:handrills/widgets/shared/home-button.dart';
import 'package:handrills/widgets/shared/info-button.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/clock.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SiganExercise extends StatelessWidget {
  final double textFieldWidth = 70;

  getContent(BuildContext context, SiganNotifier siganNotifier) {
    var s = siganNotifier.getActive();
    var isHourCorrect = s.correctHour == s.userHour;
    var isMinCorrect = s.correctMin == s.userMin;
    var isSecCorrect = s.correctSec == s.userSec;

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          ExerciseHeader(
            clear: siganNotifier.clearInput,
            setNext: siganNotifier.setNext,
            setPrevious: siganNotifier.setPrevious,
          ),
          Clock(time: '${s.hour}:${s.min}:${s.sec}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.typeTheTime),
              InfoButton(
                text: AppLocalizations.of(context)!.timeDesc,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  AnswerStatusButton(isCorrect: isHourCorrect),
                  Container(
                    width: textFieldWidth,
                    child: QuestionFreeForm(
                      activeValue: s.userHour,
                      hintValue: '',
                      correctValues: [s.correctHour],
                      onChanged: (String newVal) =>
                          siganNotifier.updateHour(newVal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('시'),
                  ),
                ],
              ),
              Column(
                children: [
                  AnswerStatusButton(isCorrect: isMinCorrect),
                  Container(
                    width: textFieldWidth,
                    child: QuestionFreeForm(
                      activeValue: s.userMin,
                      hintValue: '',
                      correctValues: [s.correctMin],
                      onChanged: (String newVal) =>
                          siganNotifier.updateMin(newVal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('분'),
                  ),
                ],
              ),
              Column(
                children: [
                  AnswerStatusButton(isCorrect: isSecCorrect),
                  Container(
                    width: textFieldWidth,
                    child: QuestionFreeForm(
                      activeValue: s.userSec,
                      hintValue: '',
                      correctValues: [s.correctSec],
                      onChanged: (String newVal) =>
                          siganNotifier.updateSec(newVal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('초'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var footerButtonWidth = HD.getScreenWidth(context, halfWidth: true) - 20;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) => BackButton()),
          elevation: APPBAR_ELEVATION,
          backgroundColor: HD.getAppBarColor(context),
          iconTheme: HD.getAppBarIconTheme(context),
          title: Text(AppLocalizations.of(context)!.numbers,
              style: HEADER_TEXT_STYLE),
        ),
        body: ChangeNotifierProvider<SiganNotifier>(
          create: (context) => SiganNotifier(),
          child: Consumer<SiganNotifier>(
            builder: (context, model, child) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getContent(context, model),
                  AdCard(),
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
      ),
    );
  }
}
