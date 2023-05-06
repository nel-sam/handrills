import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/dongsa/dongsa_notifier.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/exercise_nav_notifier.dart';
import 'package:handrills/widgets/dongsa_exercise/dongsa_exercise_state_area.dart';
import 'package:handrills/widgets/dongsa_exercise/verb_chart.dart';
import 'package:handrills/widgets/shared/ad_card.dart';
import 'package:handrills/widgets/shared/nav_header_wrapper.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:provider/provider.dart';

class DongsaExerciseLevel1 extends StatelessWidget {
  const DongsaExerciseLevel1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ChangeNotifierProvider<ExerciseNavNotifier>(
        create: (context) => ExerciseNavNotifier(ExerciseType.Dongsa),
        child: Consumer<ExerciseNavNotifier>(
          builder: (context, navNotifier, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: Nrs.NrsAppBar(
                title: '${HD.t('verbs')} 1 (반말)', context: context),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavHeaderWrapper(navNotifier: navNotifier),
                  Expanded(child: getExercises(context, navNotifier)),
                  AdCard(),
                ],
              ),
            ),
            persistentFooterButtons: [
              NFooterMenu(
                buttons: [
                  NFooterButton(
                    text: HD.t('verbChart'),
                    icon: Icons.list,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VerbChart(dongsa: navNotifier.getActive().dongsa),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getExercises(BuildContext context, ExerciseNavNotifier navNotifier) {
    return ChangeNotifierProvider<DongsaNotifier>(
      create: (context) => DongsaNotifier(navNotifier.getActive),
      child: Consumer<DongsaNotifier>(
        builder: (context, dongsaNotifier, child) {
          var dongsa = dongsaNotifier.getActive();
          return DongsaExerciseStateArea(state: dongsa);
        },
      ),
    );
  }
}
