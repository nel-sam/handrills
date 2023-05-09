import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/widgets/menus/main_menu.dart';
import 'package:localization/localization.dart';
import 'package:nrs_flutter_lib/themes.dart';
import 'package:nrs_flutter_lib/widgets/n_keyboard_message.dart';
import 'package:nrs_flutter_lib/widgets/n_spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  final RequestConfiguration requestConfiguration = RequestConfiguration(
      tagForUnderAgeOfConsent: TagForUnderAgeOfConsent.yes);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);

  runApp(HandrillsApp());
}

Future<bool> getIsFirstTimeSetting() async {
  final preferences = (await SharedPreferences.getInstance());
  final isFirstTime = preferences.getBool('isFirstTime') ?? true;
  return isFirstTime;
}

Future setFirstTimeSetting() async {
  final preferences = (await SharedPreferences.getInstance());
  preferences.setBool("isFirstTime", false);
}

class HandDrillsHomePage extends StatefulWidget {
  HandDrillsHomePage({Key? key}) : super(key: key);

  @override
  _HandDrillsHomePageState createState() => _HandDrillsHomePageState();
}

class HandrillsApp extends StatelessWidget {
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
          textTheme: nrsTextTheme,
          appBarTheme: nrsAppBarThemeLight,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
            primary: primaryColor,
            onPrimary: Colors.white,
          ),
          appBarTheme: nrsAppBarThemeDark,
          textTheme: nrsTextTheme,
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
              return NKeyboardMessage(
                welcomeText: HD.t('welcome_to_handrills'),
                detailsText: HD.t('korean_keyboard_needed'),
                instructionsButtonText: HD.t('instructions'),
                continueLinkText: HD.t('continue'),
                imageUrl: 'assets/banners/slant_keyboard.png',
                onContinue: () async {
                  await setFirstTimeSetting();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              );
            } else {
              return MainMenu();
            }
          } else {
            return NSpinner();
          }
        });
  }
}
