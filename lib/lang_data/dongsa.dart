import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dongsa {
  final String stem;
  final String infinitive;
  final DongsaConj banmar;
  final bool isIrregular;
  final String Function(BuildContext) getTranslation;

  Dongsa({
    required this.stem,
    required this.infinitive,
    required this.banmar,
    required this.getTranslation,
    required this.isIrregular,
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
    stem: '걷',
    isIrregular: true,
    infinitive: '걷다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.keodda,
    banmar: DongsaConj(
      present: '걸어',
      past: '걸었어',
      futureStem: '걸을',
      pastStem: '걸었',
    ),
  ),
  Dongsa(
    stem: '들',
    isIrregular: true,
    infinitive: '들다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.turda,
    banmar: DongsaConj(
      present: '들어',
      past: '들었어',
      futureStem: '들',
      pastStem: '들었',
    ),
  ),
  Dongsa(
    stem: '먹',
    isIrregular: false,
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
    stem: '달리',
    isIrregular: false,
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
    stem: '하',
    isIrregular: false,
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
    stem: '지',
    isIrregular: false,
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
    stem: '오',
    isIrregular: false,
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
    stem: '가',
    isIrregular: false,
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
    stem: '보',
    isIrregular: false,
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
  Dongsa(
    stem: '들',
    isIrregular: false,
    infinitive: '듣다',
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.dudda,
    banmar: DongsaConj(
      present: '들어',
      past: '들었어',
      futureStem: '들',
      pastStem: '들었',
    ),
  ),
];
