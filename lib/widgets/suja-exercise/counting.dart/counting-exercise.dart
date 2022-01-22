import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/suja/count-notifier.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/answer-status-button.dart';
import 'package:handrills/widgets/shared/exercise-header.dart';
import 'package:handrills/widgets/shared/footer-button.dart';
import 'package:handrills/widgets/shared/hd-text.dart';
import 'package:handrills/widgets/shared/home-button.dart';
import 'package:handrills/widgets/shared/info-button.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CountingExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var footerButtonWidth = HD.getScreenWidth(context, halfWidth: true) - 20;

    getContent(CountNotifier model) {
      var s = model.getActive();
      var isCorrect = s.getIsCorrect();
      var label = s.getLabel(context);

      var infoText = s.isSino
          ? AppLocalizations.of(context)!.use_sino
          : AppLocalizations.of(context)!.use_native;

      infoText += ' ${label.toLowerCase()}: ${s.correctAnswer}${s.isSino ? '': ' '}${s.counter}';

      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ExerciseHeader(
              setPrevious: model.setPrevious,
              setNext: model.setNext,
              clear: model.clearInput,
            ),
            Column(
              children: [
                Icon(s.icon, size: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HDText(label, isBold: true),
                    InfoButton(text: infoText),
                  ],
                ),
                Text(
                  '× ${s.count}',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: AnswerStatusButton(
                  isCorrect: isCorrect,
                )),
                Container(
                  width: 80,
                  child: QuestionFreeForm(
                    activeValue: s.userInput,
                    hintValue: '',
                    onChanged: (String newVal) => model.updateCount(newVal),
                    correctValues: [s.correctAnswer],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(s.counter, style: TextStyle(fontSize: 28)),
                ),
              ],
            ),
          ],
        ),
      );
    }

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
        body: ChangeNotifierProvider<CountNotifier>(
          create: (context) => CountNotifier(),
          child: Consumer<CountNotifier>(
            builder: (context, model, child) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getContent(model),
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
