import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/comic/comic_exercise_state.dart';
import 'package:handrills/widgets/comic_exercise/speech_bubble.dart';

final comicWordsBank = [
  ComicExerciseModel(
    imageUrl: 'assets/comics/birthday.jpeg',
    phrases: [
      Phrase(
        // 생일 축하해
        translation: HD.t('happy_birthday'),
        phraseParts: [
          PhrasePart(text: '생일', isAnswerable: true),
          PhrasePart(text: ' '),
          PhrasePart(text: '축하', isAnswerable: true),
          PhrasePart(text: '해'),
        ],
        downPercentage: 3,
        rightPercentage: 3,
      ),
    ],
  ),
  ComicExerciseModel(
    imageUrl: 'assets/comics/kimbap.jpeg',
    phrases: [
      Phrase(
        // 김밥이 진짜 맛있어
        translation: HD.t('kimbap_is_really_delicious'),
        phraseParts: [
          PhrasePart(text: '김밥이 진짜 '),
          PhrasePart(text: '맛있어', isAnswerable: true),
        ],
        downPercentage: 68,
        rightPercentage: 10,
      ),
    ],
  ),
];
