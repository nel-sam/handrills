import 'dart:collection';

import 'package:handrills/widgets/comic_exercise/speech_bubble.dart';

class ComicExerciseModel {
  final String imageUrl;
  final List<Phrase> phrases;

  ComicExerciseModel({required this.imageUrl, required this.phrases});
}

class ComicExerciseState {
  Map<String, String> userInput = new HashMap<String, String>();
  ComicExerciseModel comicExerciseModel;

  ComicExerciseState({required this.comicExerciseModel});

  clear() {
    userInput.clear();
  }

  List<String> getCorrectAnswers(PhrasePart? phrasePart) {
    if (phrasePart == null || !phrasePart.isAnswerable) return [''];
    return [phrasePart.text];
  }

  String getUserInput(PhrasePart? phrasePart) {
    if (phrasePart == null) return '';

    return this.userInput[_getInputKey(phrasePart)] ?? '';
  }

  bool isPhrasePartCorrect(PhrasePart? phrasePart) {
    if (phrasePart == null) return false;

    final correctAnswers = getCorrectAnswers(phrasePart);
    final currentInput = getUserInput(phrasePart);
    final isCorrect = correctAnswers.contains(currentInput);
    return isCorrect;
  }

  updateUserInput(PhrasePart? phrasePart, String newValue) {
    if (phrasePart == null) return;
    userInput[_getInputKey(phrasePart)] = newValue;
  }

  String _getInputKey(PhrasePart phrasePart) {
    return phrasePart.text;
  }
}

class MangaExerciseModel {
  final String imageUrl;
  final List<Phrase> phrases;

  MangaExerciseModel({required this.imageUrl, required this.phrases});
}
