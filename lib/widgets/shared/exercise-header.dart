import 'package:flutter/material.dart';
import 'package:handrills/widgets/shared/icon-text-button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExerciseHeader extends StatelessWidget {
  final Function setPrevious;
  final Function setNext;
  final Function clear;

  const ExerciseHeader({
    Key? key,
    required this.setPrevious,
    required this.setNext,
    required this.clear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconTextButton(
            text: AppLocalizations.of(context)!.previous,
            onPressed: setPrevious,
            icon: Icons.skip_previous_outlined,
          ),
          IconTextButton(
            text: AppLocalizations.of(context)!.clear,
            onPressed: clear,
            icon: Icons.refresh_outlined,
          ),
          IconTextButton(
            text: AppLocalizations.of(context)!.next,
            onPressed: setNext,
            icon: Icons.skip_next_outlined,
          ),
        ],
      ),
    );
  }
}
