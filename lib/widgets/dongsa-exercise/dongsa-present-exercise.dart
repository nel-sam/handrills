import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/models/dongsa-notifier.dart';
import 'package:handrills/widgets/dongsa-exercise/verb-chart.dart';
import 'package:handrills/widgets/dongsa-exercise/verb-input.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/footer-button.dart';
import 'package:handrills/widgets/shared/hd-text.dart';
import 'package:handrills/widgets/shared/home-button.dart';
import 'package:handrills/widgets/shared/icon-text-button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DongsaPresentExercise extends StatelessWidget {
  const DongsaPresentExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var footerButtonWidth = (screenSize.width / 2) - 20;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ChangeNotifierProvider<DongsaNotifier>(
        create: (context) => DongsaNotifier(),
        child: Consumer<DongsaNotifier>(
          builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: Builder(builder: (BuildContext context) => BackButton()),
              elevation: APPBAR_ELEVATION,
              backgroundColor: HD.getAppBarColor(context),
              iconTheme: HD.getAppBarIconTheme(context),
              title: Text('${AppLocalizations.of(context)!.verbs} 1 (반말)',
                  style: HEADER_TEXT_STYLE),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getHeader(context, model),
                  Expanded(child: getExercises(context, model)),
                  AdCard(),
                ],
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
                    MaterialPageRoute(
                      builder: (context) =>
                          VerbChart(dongsa: model.state.dongsa),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getExercises(BuildContext context, DongsaNotifier model) {
    var dongsa = model.state.dongsa;
    var width = HD.getScreenWidth(context, halfWidth: true) + 40;

    return Container(
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HDText(dongsa.infinitive, isBold: true),
              HDText(dongsa.getTranslation(context)),
            ],
          ),
          VerbInput(
            dongsa: dongsa,
            label: AppLocalizations.of(context)!.present,
            correctValue: dongsa.banmar.present,
          ),
          VerbInput(
            dongsa: dongsa,
            label: AppLocalizations.of(context)!.past,
            correctValue: dongsa.banmar.past,
          ),
          VerbInput(
            dongsa: dongsa,
            label: AppLocalizations.of(context)!.future,
            correctValue: '${dongsa.banmar.futureStem} 거 야',
          ),
        ],
      ),
    );
  }

  Widget getHeader(BuildContext context, DongsaNotifier model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconTextButton(
            text: AppLocalizations.of(context)!.clear,
            onPressed: model.clearState,
            icon: Icons.refresh_outlined,
          ),
          IconTextButton(
            text: AppLocalizations.of(context)!.next,
            onPressed: model.setNewVerb,
            icon: Icons.skip_next_outlined,
          ),
        ],
      ),
    );
  }
}
