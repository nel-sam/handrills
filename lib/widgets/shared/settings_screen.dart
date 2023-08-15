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
  List<Dongsa> selectedVerbs = List<Dongsa>.from(dongsaBank);
  bool verbShuffle = false;
  bool selectAllVerbs = true;
  bool isExpandedVerbs = false;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${HD.t('select')} ${HD.t(widget.exerciseType.name.toString().toLowerCase())}'),
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
      selectAllVerbs = prefs.getBool('selectAllVerbs') ?? true;
      verbShuffle = prefs.getBool('verbShuffle') ?? false;
      isExpandedVerbs = prefs.getBool('isExpandedVerbs') ?? false;

      String jsonVerbs = prefs.getString('verbs') ?? '';
      List<dynamic> jsonVerbList = jsonDecode(jsonVerbs);
      selectedVerbs = jsonVerbList.map((e) => Dongsa.fromJson(e)).toList();
    });
  }

  void saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('selectAllVerbs', selectAllVerbs);
    await prefs.setBool('verbShuffle', verbShuffle);
    await prefs.setBool('isExpandedVerbs', isExpandedVerbs);

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
                  Icon(
                    selectAllVerbs ? Icons.deselect : Icons.select_all,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectAllVerbs = !selectAllVerbs;
                        if (selectAllVerbs) {
                          selectedVerbs = List<Dongsa>.from(dongsaBank);
                        } else {
                          selectedVerbs.clear();
                          selectedVerbs.add(dongsaBank.first);
                          isExpandedVerbs = true;
                        }
                        saveSettings();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectAllVerbs ? HD.t('clearall') : HD.t('selectall'),
                        style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize!,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
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
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  isExpandedVerbs ? Icons.expand_less : Icons.expand_more,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  setState(() {
                    isExpandedVerbs = !isExpandedVerbs;
                  });
                  saveSettings();
                },
              ),
              Text(
                selectedVerbs.length == dongsaBank.length
                    ? '${HD.t('selectedverbs')} (all)'
                    : '${HD.t('selectedverbs')} (${selectedVerbs.length})',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize:
                        Theme.of(context).textTheme.titleMedium!.fontSize!),
              )
            ],
          ),
        ),
        if (isExpandedVerbs)
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
                          selectedVerbs.removeWhere((element) =>
                              element.infinitive == item.infinitive);
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
