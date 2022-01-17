import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dongsa {
  final String infinitive;
  final DongsaConj banmar;
  final String Function(BuildContext) getTranslation;

  Dongsa({
    required this.infinitive,
    required this.banmar,
    required this.getTranslation,
  });
}

class DongsaConj {
  final String present;
  final String past;
  final String futureStem;
  final String pastStem;

  DongsaConj({
    required this.present,
    required this.past,
    required this.futureStem,
    required this.pastStem,
  });
}

var dongsaBank = [
  Dongsa(
    infinitive: '먹다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.meogda,
    banmar: DongsaConj(
      present: '먹어',
      past: '먹었어',
      futureStem: '먹을',
      pastStem: '먹었',
    ),
  ),
  Dongsa(
    infinitive: '달리다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.darrida,
    banmar: DongsaConj(
      present: '달려',
      past: '달렸어',
      futureStem: '달릴',
      pastStem: '달렸',
    ),
  )
];
