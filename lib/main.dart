import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/state/suja.exercise-notifier.dart';
import 'package:handrills/widgets/menus/main-menu.dart';
import 'package:handrills/widgets/suja-exercise/suja-exercise.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'HanDrills';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: ACCENT_COLOR,
      ),
      darkTheme: ThemeData(
        primarySwatch: ACCENT_COLOR,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black12,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SujaExerciseNotifier())
        ],
        child: MyHomePage(title: title),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MainMenu(),
      ),
    );
  }
}
