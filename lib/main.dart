import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/widgets/menus/main_menu.dart';
import 'package:localization/localization.dart';

void main() {
  runApp(MyApp());
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
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.black,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
              primary: primaryColor,
              background: const Color(0xFF212121),
              onPrimary: Colors.white),
          dividerColor: Colors.black12,
        ),
        themeMode: ThemeMode.system,
        home: HandDrillsHomePage());
  }
}

class _HandDrillsHomePageState extends State<HandDrillsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainMenu(),
      ),
    );
  }
}
