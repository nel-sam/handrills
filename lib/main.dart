import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/widgets/menus/main_menu.dart';
import 'package:localization/localization.dart';

void main() {
  runApp(MyApp());
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
          primarySwatch: primaryColor,
          primaryColor: Colors.black,
          brightness: Brightness.dark,
          dividerColor: Colors.black12,
          colorScheme: ColorScheme.dark(background: const Color(0xFF212121)),
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainMenu(),
      ),
    );
  }
}
