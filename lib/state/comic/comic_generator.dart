import 'package:handrills/lang_data/comics.dart';

import 'comic_exercise_state.dart';

class ComicsGenerator {
  static createExercise(int index) {
    return ComicExerciseState(comicExerciseModel: comicWordsBank[index]);
  }

  static int getMaxIndex() {
    return comicWordsBank.length - 1;
  }
}
