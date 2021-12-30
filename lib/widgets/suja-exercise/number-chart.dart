import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/widgets/shared/hd-sub-header.dart';

class NumberChart extends StatelessWidget {
  NumberChart({Key? key}) : super(key: key) {
    boldStyle = TextStyle(fontWeight: FontWeight.bold);
  }
  late TextStyle boldStyle;

  getSinoNumberChart(BuildContext context) {
    List<HanNumber> numbers = [];
    var maxNum = 100;

    for (int i = 0; i <= maxNum; i++) {
      var hn = HD.getSinoNumber(i);
      var written = hn.alternate == hn.written
          ? hn.written
          : '${hn.written}/${hn.alternate}';
      numbers.add(HanNumber(digit: hn.digit, written: written));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              HdSubHeader(AppLocalizations.of(context)!.nativeNumbers),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ...numbers.getRange(0, 34).map((e) => Text(
                      '${e.digit} ${e.written}',
                      style: boldStyle,
                    ))
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ...numbers
                    .getRange(34, 67)
                    .map((e) => Text('${e.digit} ${e.written}'))
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ...numbers.getRange(67, 101).map((e) => Text(
                      '${e.digit} ${e.written}',
                      style: boldStyle,
                    ))
              ]),
            ],
          ),
        ],
      ),
    );
  }

  getNativeNumberChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              HdSubHeader(AppLocalizations.of(context)!.sinoNumbers),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ...nativeNumberBank.getRange(1, 34).map((e) => Text(
                      '${e.digit} ${e.written}',
                      style: boldStyle,
                    ))
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ...nativeNumberBank
                    .getRange(34, 67)
                    .map((e) => Text('${e.digit} ${e.written}'))
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ...nativeNumberBank.getRange(67, 100).map((e) => Text(
                      '${e.digit} ${e.written}',
                      style: boldStyle,
                    ))
              ]),
            ],
          ),
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
