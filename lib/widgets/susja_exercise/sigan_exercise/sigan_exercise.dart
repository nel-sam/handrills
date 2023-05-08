import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/exercise_nav_notifier.dart';
import 'package:handrills/state/susja/sigan/sigan_notifier.dart';
import 'package:handrills/widgets/shared/ad_card.dart';
import 'package:handrills/widgets/shared/home_button_wrapper.dart';
import 'package:handrills/widgets/shared/nav_header_wrapper.dart';
import 'package:handrills/widgets/susja_exercise/number_chart.dart';
import 'package:handrills/widgets/susja_exercise/sigan_exercise/clock.dart';
import 'package:handrills/widgets/susja_exercise/sigan_exercise/sigan_exercise_state_area.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:nrs_flutter_lib/widgets/n_info_button.dart';
import 'package:provider/provider.dart';

class SiganExercise extends StatelessWidget {
  final double textFieldWidth = 70;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Nrs.NrsAppBar(title: HD.t('numbers'), context: context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getContent(context),
              AdCard(),
            ],
          ),
        ),
        persistentFooterButtons: [
          NFooterMenu(buttons: [
            HomeButtonWrapper(),
            NFooterButton(
              text: HD.t('numberChart'),
              icon: Icons.list,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumberChart()),
                );
              },
            ),
          ])
        ],
      ),
    );
  }

  getContent(BuildContext context) {
    return ChangeNotifierProvider<ExerciseNavNotifier>(
      create: (context) => ExerciseNavNotifier(ExerciseType.Sigan),
      child: Consumer<ExerciseNavNotifier>(
        builder: (context, navNotifier, child) {
          var s = navNotifier.getActive();
          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                NavHeaderWrapper(navNotifier: navNotifier),
                Clock(time: '${s.hour}:${s.min}:${s.sec}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(HD.t('typeTheTime')),
                    NInfoButton(
                      text: HD.t('timeDesc'),
                    ),
                  ],
                ),
                ChangeNotifierProvider<SiganNotifier>(
                  create: (context) => SiganNotifier(navNotifier.getActive),
                  child: Consumer<SiganNotifier>(
                    builder: (context, siganNotifier, child) {
                      var s = siganNotifier.getStateItem();
                      return SiganExerciseStateArea(state: s);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
