import 'package:flutter/material.dart';

class Phrase {
  final String translation;
  final List<PhrasePart> phraseParts;
  final double downPercentage;
  final double rightPercentage;

  Phrase(
      {required this.translation,
      required this.phraseParts,
      required this.downPercentage,
      required this.rightPercentage});
}

class PhrasePart {
  final bool isAnswerable;
  final String text;

  PhrasePart({
    this.isAnswerable = false,
    required this.text,
  });
}

class SpeechBubble extends StatelessWidget {
  final Phrase phrase;
  final bool Function(PhrasePart activePhrase) getIsCorrect;
  final Function(PhrasePart activePhrase) onButtonTap;

  const SpeechBubble(
      {Key? key,
      required this.phrase,
      required this.getIsCorrect,
      required this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: LayoutBuilder(builder: (context, constraints) {
        final left = this.phrase.rightPercentage / 100;
        final top = this.phrase.downPercentage / 100;

        return Container(
          alignment: FractionalOffset(left, top),
          child: FractionallySizedBox(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4, bottom: 0, left: 18, right: 18),
                child: Wrap(
                  children: this.phrase.phraseParts.map((e) {
                    final isCorrect = getIsCorrect(e);

                    return e.isAnswerable && !isCorrect
                        ? Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ElevatedButton(
                              onPressed: () => onButtonTap(e),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.create_sharp,
                                    size: 16.0,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Text(e.text,
                                style: TextStyle(
                                  color: e.isAnswerable
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                )),
                          );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
