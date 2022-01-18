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
  ),
  Dongsa(
    infinitive: '하다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.hada,
    banmar: DongsaConj(
      present: '해',
      past: '했어',
      futureStem: '할',
      pastStem: '했',
    ),
  ),
  Dongsa(
    infinitive: '지다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.jida,
    banmar: DongsaConj(
      present: '져',
      past: '졌어',
      futureStem: '질',
      pastStem: '졌',
    ),
  ),
  Dongsa(
    infinitive: '오다',
    getTranslation: (BuildContext context) => AppLocalizations.of(context)!.oda,
    banmar: DongsaConj(
      present: '와',
      past: '왔어',
      futureStem: '올',
      pastStem: '왔',
    ),
  ),
  Dongsa(
    infinitive: '가다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.gada,
    banmar: DongsaConj(
      present: '가',
      past: '갔어',
      futureStem: '갈',
      pastStem: '갔',
    ),
  ),
  Dongsa(
    infinitive: '보다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.boda,
    banmar: DongsaConj(
      present: '봐',
      past: '봤어',
      futureStem: '볼',
      pastStem: '봤',
    ),
  ),
];
