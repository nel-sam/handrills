import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/hd-text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: HD.getAppBarColor(context),
        iconTheme: HD.getAppBarIconTheme(context),
        title: Text(dongsa.infinitive, style: HEADER_TEXT_STYLE),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Expanded(
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
                    ],
                  ),
                ),
              ),
            ),
            AdCard(),
          ],
        ),
      ),
    );
  }
}

class ChartRow extends StatelessWidget {
  const ChartRow({
    Key? key,
    required this.label,
    required this.conj,
  }) : super(key: key);

  final String label;
  final String conj;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 70,
            child: HDText(
              label,
              textAlign: TextAlign.end,
            )),
        HDText(conj, isBold: true),
      ],
    );
  }
}
