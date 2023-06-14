import 'package:flutter/material.dart';
import 'package:handrills/state/comic/comic_exercise_state.dart';
import 'package:handrills/state/exercise_nav_notifier.dart';
import 'package:handrills/widgets/comic_exercise/speech_bubble.dart';
import 'package:nrs_flutter_lib/widgets/n_free_form_entry.dart';

class ComicExerciseStateArea extends StatefulWidget {
  final ComicExerciseState state;
  final ExerciseNavNotifier navNotifier;

  const ComicExerciseStateArea({
    required this.state,
    Key? key,
    required this.navNotifier,
  }) : super(key: key);

  @override
  State<ComicExerciseStateArea> createState() => _ComicExerciseStateAreaState();
}

class _ComicExerciseStateAreaState extends State<ComicExerciseStateArea> {
  PhrasePart? activePhrasePart;
  Phrase? activePhrase;

  Widget build(BuildContext context) {
    // TODO: Is there a better way to do detect next/previous button press?
    widget.navNotifier.onNextOrPrevious = () => activePhrasePart = null;
    const double padding = 8.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image(
              fit: BoxFit.cover,
              image: AssetImage(widget.state.comicExerciseModel.imageUrl),
            ),
            ...widget.state.comicExerciseModel.phrases.map(
              (p) => SpeechBubble(
                getIsCorrect: widget.state.isPhrasePartCorrect,
                phrase: p,
                onButtonTap: (PhrasePart phrasePart) => {
                  setState(() {
                    activePhrasePart = phrasePart;
                    activePhrase = p;
                  })
                },
              ),
            ),
          ],
        ),
        activePhrasePart != null && activePhrase != null
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: padding),
                    child: Text(activePhrase!.translation),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: padding),
                    child: Wrap(
                        children: activePhrase!.phraseParts.map((e) {
                      return e.isAnswerable
                          ? Text(
                              ' ____ ',
                              style: TextStyle(
                                height: 2.5,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          : Text(e.text);
                    }).toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(padding),
                    child: NFreeFormEntry(
                      widthType: NFreeFormWidths.half,
                      labelText: '',
                      onChanged: (String newValue) {
                        widget.state
                            .updateUserInput(activePhrasePart, newValue);

                        final isPhrasePartCorrect =
                            widget.state.isPhrasePartCorrect(activePhrasePart);

                        if (isPhrasePartCorrect) {
                          setState(() {
                            activePhrasePart = null;
                          });
                        }
                      },
                      initialValue: widget.state.getUserInput(activePhrasePart),
                      correctValues:
                          widget.state.getCorrectAnswers(activePhrasePart),
                      onCorrect: () {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
