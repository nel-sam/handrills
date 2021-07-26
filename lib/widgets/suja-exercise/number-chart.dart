import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NumberChart extends StatelessWidget {
  const NumberChart({Key? key}) : super(key: key);

  getNativeNumberChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(AppLocalizations.of(context)!.nativeNumbers),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('0'),
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                  // Text('5'),
                  // Text('6'),
                  // Text('7'),
                  // Text('8'),
                  // Text('9'),
                  // Text('10'),
                  // Text('11'),
                  // Text('12'),
                ],
              ),
              Column(
                children: [
                  Text('영'),
                  Text('하나/한'),
                  Text('들/들'),
                  Text('셋/세'),
                  Text('셋/세'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  getSinoNumberChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(AppLocalizations.of(context)!.sinoNumbers),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('0'),
                  Text('1'),
                  Text('2'),
                  Text('3'),
                ],
              ),
              Column(
                children: [
                  Text('영'),
                  Text('일'),
                  Text('이'),
                  Text('삼'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) => BackButton()),
          elevation: APPBAR_ELEVATION,
          backgroundColor: HD.getAppBarColor(context),
          textTheme: HD.getAppBarTextTheme(context),
          iconTheme: HD.getAppBarIconTheme(context),
          title: Text(AppLocalizations.of(context)!.numberChart,
              style: HEADER_TEXT_STYLE),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                getNativeNumberChart(context),
                getSinoNumberChart(context),
              ],
            ),
          ),
        ));
  }
}
