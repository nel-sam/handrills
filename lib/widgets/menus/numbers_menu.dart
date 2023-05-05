import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/widgets/shared/ad_card.dart';
import 'package:handrills/widgets/shared/hd_footer_menu.dart';
import 'package:handrills/widgets/suja_exercise/age/age_exercise.dart';
import 'package:handrills/widgets/suja_exercise/counting.dart/counting_exercise.dart';
import 'package:handrills/widgets/suja_exercise/sigan_exercise/sigan_exercise.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_header.dart';

class NumbersMenu extends StatelessWidget {
  const NumbersMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(context: context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AdCard(),
              NMenuHeader(
                  icon: Icons.widgets_outlined,
                  transLabel: HD.t('numbers'),
                  label: '수자'),
              Column(
                children: [
                  NMenuButton(
                    destination: SiganExercise(),
                    label: HD.t('time'),
                    transLabel: '시간',
                  ),
                  NMenuButton(
                    destination: AgeExercise(),
                    label: HD.t('age'),
                    transLabel: '나이',
                  ),
                  NMenuButton(
                    destination: CountingExercise(),
                    label: HD.t('counting'),
                    transLabel: '계산',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [HDMenuFooter(activeIndex: 1)],
    );
  }
}
