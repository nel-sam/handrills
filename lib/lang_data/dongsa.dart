import 'package:handrills/hd_helpers.dart';

var dongsaBank = [
  Dongsa(
    // 끄다
    stem: '끄',
    isIrregular: false,
    infinitive: '끄다',
    translation: HD.t('kkeuda'),
    banmar: DongsaConj(
      present: '끌어',
      past: '끌었어',
      futureStem: '끌',
      pastStem: '끌었',
    ),
  ),
  Dongsa(
    // 켜다
    stem: '켜',
    isIrregular: false,
    infinitive: '켜다',
    translation: HD.t('kyeoda'),
    banmar: DongsaConj(
      present: '켜',
      past: '켰어',
      futureStem: '켤',
      pastStem: '켰',
    ),
  ),
  Dongsa(
    // 당기다
    stem: '당기',
    isIrregular: false,
    infinitive: '당기다',
    translation: HD.t('danggida'),
    banmar: DongsaConj(
      present: '당겨',
      past: '당겼어',
      futureStem: '당길',
      pastStem: '당겼',
    ),
  ),
  Dongsa(
    // 밀다
    stem: '밀',
    isIrregular: false,
    infinitive: '밀다',
    translation: HD.t('milda'),
    banmar: DongsaConj(
      present: '밀어',
      past: '밀었어',
      futureStem: '밀',
      pastStem: '밀었',
    ),
  ),
  Dongsa(
    // 끝나다
    stem: '끝나',
    isIrregular: false,
    infinitive: '끝나다',
    translation: HD.t('kkeutnada'),
    banmar: DongsaConj(
      present: '끝나',
      past: '끝났어',
      futureStem: '끝낼',
      pastStem: '끝났',
    ),
  ),
  Dongsa(
// 시작하다
    stem: '시작하',
    isIrregular: false,
    infinitive: '시작하다',
    translation: HD.t('sijakhada'),
    banmar: DongsaConj(
      present: '시작해',
      past: '시작했어',
      futureStem: '시작할',
      pastStem: '시작했',
    ),
  ),
  Dongsa(
    // 닫다
    stem: '닫',
    isIrregular: false,
    infinitive: '닫다',
    translation: HD.t('dadda'),
    banmar: DongsaConj(
      present: '닫아',
      past: '닫았어',
      futureStem: '닫을',
      pastStem: '닫았',
    ),
  ),
  Dongsa(
    // 열다
    stem: '열',
    isIrregular: false,
    infinitive: '열다',
    translation: HD.t('yeolda'),
    banmar: DongsaConj(
      present: '여',
      past: '열었어',
      futureStem: '열',
      pastStem: '열었',
    ),
  ),
  Dongsa(
    stem: '걷',
    isIrregular: false,
    infinitive: '걷다',
    translation: HD.t('keodda'),
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
    translation: HD.t('turda'),
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
    translation: HD.t('meogda'),
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
    translation: HD.t('darrida'),
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
    translation: HD.t('hada'),
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
    translation: HD.t('jida'),
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
    translation: HD.t('oda'),
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
    translation: HD.t('gada'),
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
    translation: HD.t('boda'),
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
    translation: HD.t('dudda'),
    banmar: DongsaConj(
      present: '들어',
      past: '들었어',
      futureStem: '들',
      pastStem: '들었',
    ),
  ),
];

class Dongsa {
  final String stem;
  final String infinitive;
  final DongsaConj banmar;
  final bool isIrregular;
  final String translation;

  Dongsa({
    required this.stem,
    required this.infinitive,
    required this.banmar,
    required this.translation,
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
