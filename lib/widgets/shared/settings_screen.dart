import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/widgets/dongsa_exercise/dongsa_exercise_1.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SettingsScreen extends StatefulWidget {
  final ExerciseType exerciseType;

  SettingsScreen({required this.exerciseType});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<Dongsa> selectedVerbs = [];
  bool verbShuffle = false;
  bool selectAllVerbs = false;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(HD.t(widget.exerciseType.name.toString().toLowerCase()) +
              ' ' +
              HD.t('settings')),
        ),
        body: allSettings(widget.exerciseType));
  }

  Widget allSettings(ExerciseType exerciseType) {
    Widget settings = ListView();
    switch (exerciseType) {
      case ExerciseType.Dongsa:
        settings = dongsaSettings();
        break;
    }
    return settings;
  }

  void loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectAllVerbs = prefs.getBool('selectAllVerbs') ?? false;
      verbShuffle = prefs.getBool('verbShuffle') ?? false;

      String jsonVerbs = prefs.getString('verbs') ?? '';
      if (jsonVerbs.isNotEmpty) {
        List<dynamic> jsonList = jsonDecode(jsonVerbs);
        selectedVerbs = jsonList.map((e) => Dongsa.fromJson(e)).toList();
      } else {
        selectedVerbs.add(dongsaBank.first);
      }
    });
  }

  void saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('selectAllVerbs', selectAllVerbs);
    await prefs.setBool('verbShuffle', verbShuffle);
    String jsonVerbs =
        jsonEncode(selectedVerbs.map((e) => e.toJson()).toList());
    await prefs.setString('verbs', jsonVerbs);
  }

  Widget dongsaSettings() {
    bool hasSelectedIItems = selectedVerbs.length == 1;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Tooltip(
                    message: HD.t('selectall'),
                    child: Icon(
                      Icons.select_all,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Switch(
                      value: selectAllVerbs,
                      onChanged: (value) {
                        setState(() {
                          selectAllVerbs = value;
                          if (selectAllVerbs) {
                            selectedVerbs = List<Dongsa>.from(dongsaBank);
                          } else {
                            selectedVerbs.clear();
                            selectedVerbs.add(dongsaBank.first);
                          }
                          saveSettings();
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: HD.t('shuffle'),
                    child: Icon(
                      Icons.shuffle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Switch(
                      value: verbShuffle,
                      onChanged: (value) {
                        setState(() {
                          verbShuffle = value;
                          saveSettings();
                        });
                      })
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1,
            ),
            itemCount: dongsaBank.length,
            itemBuilder: (BuildContext context, int index) {
              final item = dongsaBank[index];
              int i = selectedVerbs.indexWhere(
                  (element) => element.infinitive == item.infinitive);
              bool isSelected = i != -1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      if (!hasSelectedIItems)
                        selectedVerbs.removeWhere(
                            (element) => element.infinitive == item.infinitive);
                    } else {
                      selectedVerbs.add(item);
                    }
                    saveSettings();
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          item.infinitive,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize!),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                            padding: EdgeInsets.all(4),
                            child: isSelected
                                ? Text(
                                    (1 + i).toString(),
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .fontSize!,
                                        color: Colors.white),
                                  )
                                : Container()),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        NMenuButton(
          destination: DongsaExerciseLevel1(
              selectedVerbs: selectedVerbs, verbShuffle: verbShuffle),
          label: HD.t('start'),
          transLabel: '시작',
        ),
      ],
    );
  }
}
