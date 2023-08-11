import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/dongsa/dongsa_exercise_state.dart';
import 'package:handrills/widgets/dongsa_exercise/verb_input.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DongsaExerciseStateArea extends StatefulWidget {
  final DongsaExerciseState state;

  const DongsaExerciseStateArea({Key? key, required this.state})
      : super(key: key);

  @override
  State<DongsaExerciseStateArea> createState() =>
      _DongsaExerciseStateAreaState();
}

class _DongsaExerciseStateAreaState extends State<DongsaExerciseStateArea> {
  bool showVerbTranslations = true;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  void loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      showVerbTranslations = prefs.getBool('showVerbTranslations') ?? true;
    });
  }

  void saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showVerbTranslations', showVerbTranslations);
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Tooltip(
                    message: HD.t('translation'),
                    child: Icon(
                      Icons.translate,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Switch(
                      value: showVerbTranslations,
                      onChanged: (value) {
                        setState(() {
                          showVerbTranslations = value;
                          saveSettings();
                        });
                      })
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: FONT_SIZE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NTextSpan(
                widget.state.dongsa.infinitive,
                textStyle: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium!.fontSize),
              ),
              SizedBox(width: FONT_SIZE),
              NTextSpan(
                  showVerbTranslations ? widget.state.dongsa.translation : ''),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: VerbInput(
              dongsa: widget.state.dongsa,
              activeValue: widget.state.getUserInput(0),
              hintValue: HD.t('present'),
              correctValue: widget.state.dongsa.banmar.present,
              onSubmitted: (String newValue) {
                widget.state.updateUserInput(0, newValue);
              },
              onCorrect: () {
                setState(() {});
              },
            )),
        VerbInput(
          dongsa: widget.state.dongsa,
          activeValue: widget.state.getUserInput(1),
          hintValue: HD.t('past'),
          correctValue: widget.state.dongsa.banmar.past,
          onSubmitted: (String newValue) =>
              widget.state.updateUserInput(1, newValue),
          onCorrect: () {
            setState(() {});
          },
        ),
        VerbInput(
          activeValue: widget.state.getUserInput(2),
          dongsa: widget.state.dongsa,
          hintValue: HD.t('future'),
          correctValue: '${widget.state.dongsa.banmar.futureStem} 거야',
          onSubmitted: (String newValue) =>
              widget.state.updateUserInput(2, newValue),
          onCorrect: () {
            setState(() {});
          },
        ),
        VerbInput(
          activeValue: widget.state.getUserInput(4),
          dongsa: widget.state.dongsa,
          hintValue: HD.t('propositive'),
          correctValue: '${widget.state.dongsa.stem}자',
          onSubmitted: (String newValue) =>
              widget.state.updateUserInput(4, newValue),
          onCorrect: () {
            setState(() {});
          },
        ),
      ],
    );
  }
}
