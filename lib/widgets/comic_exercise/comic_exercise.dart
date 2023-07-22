import 'package:flutter/material.dart';
import 'package:handrills/state/comic/comic_notifier.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/exercise_nav_notifier.dart';
import 'package:handrills/widgets/comic_exercise/comic_exercise_state_area.dart';
import 'package:handrills/widgets/shared/ad_card.dart';
import 'package:handrills/widgets/shared/nav_header_wrapper.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:provider/provider.dart';

class ComicExercise extends StatelessWidget {
  const ComicExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: Nrs.NrsAppBar(title: '만화', context: context),
        body: Center(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ChangeNotifierProvider<ExerciseNavNotifier>(
                      create: (context) =>
                          ExerciseNavNotifier(exerciseType: ExerciseType.Comic),
                      child: Consumer<ExerciseNavNotifier>(
                        builder: (context, navNotifier, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NavHeaderWrapper(navNotifier: navNotifier),
                              ChangeNotifierProvider<ComicNotifier>(
                                create: (context) =>
                                    ComicNotifier(navNotifier.getActive),
                                child: Consumer<ComicNotifier>(
                                  builder: (context, comicNotifier, child) {
                                    return ComicExerciseStateArea(
                                      state: comicNotifier.getActive(),
                                      navNotifier: navNotifier,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    AdCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
