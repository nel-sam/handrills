import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/state/suja.exercise-notifier.dart';
import 'package:handrills/widgets/dongsa-exercise/verb-chart.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/footer-button.dart';
import 'package:handrills/widgets/shared/home-button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DongsaPresentExercise extends StatelessWidget {
  const DongsaPresentExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var footerButtonWidth = (screenSize.width / 2) - 20;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: HD.getAppBarColor(context),
        iconTheme: HD.getAppBarIconTheme(context),
        title:
            Text(AppLocalizations.of(context)!.verbs, style: HEADER_TEXT_STYLE),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ChangeNotifierProvider<SujaExerciseNotifier>(
          create: (context) => SujaExerciseNotifier(),
          child: Consumer<SujaExerciseNotifier>(
            builder: (context, sujaModel, child) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getExercises(context),
                  AdCard(),
                ],
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        HomeButton(width: footerButtonWidth),
        FooterButton(
          width: footerButtonWidth,
          context: context,
          text: AppLocalizations.of(context)!.verbChart,
          icon: Icons.list,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VerbChart()),
            );
          },
        ),
      ],
    );
  }

  Widget getExercises(BuildContext context) {
    var dongsa = dongsaBank[0];
    return Column(
      children: [
        Row(
          children: [
            Text(dongsa.infinitive),
            Text(dongsa.getTranslation(context)),
          ],
        )
      ],
    );
  }
}
