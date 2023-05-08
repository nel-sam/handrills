import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/widgets/Settings/keyboard_message.dart';
import 'package:handrills/widgets/menus/main_menu.dart';
import 'package:localization/localization.dart';
import 'package:nrs_flutter_lib/widgets/n_spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}

Future<bool> getIsFirstTimeSetting() async {
  final preferences = (await SharedPreferences.getInstance());
  final isFirstTime = preferences.getBool('isFirstTime') ?? true;
  return isFirstTime;
}

class HandDrillsHomePage extends StatefulWidget {
  HandDrillsHomePage({Key? key}) : super(key: key);

  @override
  _HandDrillsHomePageState createState() => _HandDrillsHomePageState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.pink;

      final textTheme = TextTheme(
      titleLarge: TextStyle(fontSize: 42.0),
      titleMedium: TextStyle(fontSize: 39.0),
      titleSmall: TextStyle(fontSize: 22.0),
      bodyLarge: TextStyle(fontSize: 20.0),
      bodyMedium: TextStyle(fontSize: 18.0),
      bodySmall: TextStyle(fontSize: 16.0),
    );


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: APP_NAME,
        localizationsDelegates: [
          LocalJsonLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'MX'),
        ],
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: primaryColor,
          textTheme: textTheme,
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.black,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
              primary: primaryColor,
              background: const Color(0xFF212121),
              onPrimary: Colors.white),
          dividerColor: Colors.black12,
          textTheme: textTheme,

        ),
        themeMode: ThemeMode.system,
        home: HandDrillsHomePage());
  }
}

class _HandDrillsHomePageState extends State<HandDrillsHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIsFirstTimeSetting(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if ((snapshot.data as bool)) {
              return KeyboardMessage();
            } else {
              return MainMenu();
            }
          } else {
            return NSpinner();
          }
        });
  }
}
