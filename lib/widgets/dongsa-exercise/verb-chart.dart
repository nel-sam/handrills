import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-text-span.dart';

class ChartRow extends StatelessWidget {
  final String label;

  final String conj;
  const ChartRow({
    Key? key,
    required this.label,
    required this.conj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: Nrs.getScreenWidth() / 3,
            child: NTextSpan(
              label,
              textAlign: TextAlign.end,
            )),
        NTextSpan(
          conj,
          textStyle: HD.fontStyleBold(context),
        ),
      ],
    );
  }
}

class VerbChart extends StatelessWidget {
  final Dongsa dongsa;

  const VerbChart({
    Key? key,
    required this.dongsa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(title: dongsa.infinitive, context: context),
      body: Center(
        child: Column(
          children: [
            const AdCard(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    ChartRow(
                      label: AppLocalizations.of(context)!.present,
                      conj: dongsa.banmar.present,
                    ),
                    ChartRow(
                      label: AppLocalizations.of(context)!.past,
                      conj: dongsa.banmar.past,
                    ),
                    ChartRow(
                      label: AppLocalizations.of(context)!.future,
                      conj: '${dongsa.banmar.futureStem} 거야',
                    ),
                    ChartRow(
                      label: AppLocalizations.of(context)!.conditional,
                      conj: '${dongsa.stem}겠어',
                    ),
                    ChartRow(
                      label: AppLocalizations.of(context)!.propositive,
                      conj: '${dongsa.stem}자',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
