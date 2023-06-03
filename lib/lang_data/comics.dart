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
];
