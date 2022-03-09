import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/hd-footer-menu.dart';
import 'package:handrills/widgets/suja-exercise/age/age-exercise.dart';
import 'package:handrills/widgets/suja-exercise/counting.dart/counting-exercise.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/sigan-exercise.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-button.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-header.dart';

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
                  transLabel: AppLocalizations.of(context)!.numbers,
                  label: '수자'),
              Column(
                children: [
                  NMenuButton(
                    destination: SiganExercise(),
                    label: AppLocalizations.of(context)!.time,
                    transLabel: '시간',
                  ),
                  NMenuButton(
                    destination: AgeExercise(),
                    label: AppLocalizations.of(context)!.age,
                    transLabel: '나이',
                  ),
                  NMenuButton(
                    destination: CountingExercise(),
                    label: AppLocalizations.of(context)!.counting,
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
